package com.sulake.habbo 
{
	import flash.utils.ByteArray;
	/**
	 * Implementação do algoritmo de cifra de fluxo RC4.
	 * Esta classe é usada para criptografar e descriptografar dados usando uma chave simétrica.
	 * 
	 * A versão original foi ofuscada para dificultar a engenharia reversa.
	 * @author Richard
	 */
   public class RC4Cipher
   {
      // Constante para o tamanho do S-box (estado interno da cifra).
      private const SBOX_SIZE:uint = 256;

      // O "S-box" (caixa de substituição) que armazena o estado da cifra.
      private var sbox:ByteArray;

      // Índices 'i' e 'j' usados no algoritmo de geração de keystream (PRGA).
      private var i:int = 0;
      private var j:int = 0;

      /**
       * Construtor. Inicializa a cifra com a chave fornecida.
       * @param key A chave secreta a ser usada para a criptografia/descriptografia.
       */
      public function RC4Cipher(key: ByteArray)
      {
         super();
         // A chave é usada para preparar o estado interno da cifra.
         this.initialize(key);
      }
      
      /**
       * Prepara o estado interno da cifra (S-box) usando a chave.
       * Esta é a fase conhecida como "Key-Scheduling Algorithm" (KSA).
       * @param key A chave para inicializar o S-box.
       */
      public function initialize(key: ByteArray):void
      {
         this.sbox = new ByteArray();
         var keyLength:int = key.length;
         
         // 1. Preenche o S-box com valores de 0 a 255.
         for (var k:int = 0; k < SBOX_SIZE; k++)
         {
            this.sbox[k] = k;
         }

         // 2. Embaralha o S-box com base na chave fornecida.
         var j_ksa:int = 0;
         for (k = 0; k < SBOX_SIZE; k++)
         {
            // A operação '& 255' é uma otimização para o módulo (%) 256.
            j_ksa = (j_ksa + this.sbox[k] + key[k % keyLength]) & 255;
            
            // Troca os valores de sbox[k] e sbox[j_ksa].
            var tempSwap:int = this.sbox[k];
            this.sbox[k] = this.sbox[j_ksa];
            this.sbox[j_ksa] = tempSwap;
         }

         // 3. Reseta os ponteiros para o início, prontos para gerar o keystream.
         this.i = 0;
         this.j = 0;
      }
      
      /**
       * Aplica a cifra RC4 ao ByteArray de dados fornecido.
       * A mesma função serve tanto para criptografar quanto para descriptografar.
       * O ByteArray é modificado diretamente (in-place).
       * @param data O ByteArray de dados a ser processado.
       */
      public function applyCipher(data:ByteArray):void
      {
         for (var k:uint = 0; k < data.length; k++)
         {
            // Combina cada byte dos dados com um byte do keystream usando XOR (^).
            data[k] ^= this.generateKeystreamByte();
         }
      }
      
      /**
       * Gera o próximo byte pseudo-aleatório do keystream.
       * Este é o "Pseudo-Random Generation Algorithm" (PRGA).
       * @return Um único byte (0-255) do keystream.
       */
      private function generateKeystreamByte():uint
      {
         // Incrementa os ponteiros e os mantém dentro dos limites do S-box.
         this.i = (this.i + 1) & 255;
         this.j = (this.j + this.sbox[this.i]) & 255;
         
         // Troca os valores de sbox[i] e sbox[j].
         var tempSwap:int = this.sbox[this.i];
         this.sbox[this.i] = this.sbox[this.j];
         this.sbox[this.j] = tempSwap;
         
         // Calcula o índice do byte de saída e o retorna.
         var keystreamIndex:int = (this.sbox[this.i] + this.sbox[this.j]) & 255;
         return this.sbox[keystreamIndex];
      }

      /**
       * Libera os recursos (limpa o S-box da memória) para segurança.
       * O método original `§_o_---§` tinha essa funcionalidade.
       */
      public function dispose():void
      {
         if (this.sbox != null)
         {
            // Zera o array para remover a chave e o estado da memória.
            for (var k:uint = 0; k < this.sbox.length; k++) {
               this.sbox[k] = 0;
            }
            this.sbox = null;
         }
         this.i = 0;
         this.j = 0;
      }
   }

}