package com.sulake.habbo 
{
	
	import flash.display.Sprite;
    import flash.net.LocalConnection;
    import flash.utils.ByteArray;

    // --- Classes que representam os recursos embutidos (assets) no SWF original ---
    // Estas classes não são definidas aqui, mas o código original as usa.
    // Elas seriam classes que estendem ByteArray.
    // internal class EncryptedDomainListAsset extends ByteArray {}
    // internal class DecryptionKeyAsset extends ByteArray {}
    // internal class Decryptor { function Decryptor(key:ByteArray){}; function decrypt(data:ByteArray):void{} }

	/**
	 * Classe responsável por verificar se o SWF está sendo executado em um domínio autorizado.
	 * Este é um mecanismo de proteção contra o uso não autorizado do conteúdo.
	 * @author Richard
	 */
    public class DomainLock
    {
		[Embed(source="../../../assets/file1.bin", mimeType="application/octet-stream")]
        private var EncryptedDomainListAsset: Class;
		[Embed(source="../../../assets/file2.bin", mimeType="application/octet-stream")]
        private var DecryptionKeyAsset: Class;

        /**
         * Construtor da classe.
         * Apenas inicializa as referências para os assets de dados.
         */
        public function DomainLock()
        {
        }

        /**
         * Verifica se a localização do Sprite (o SWF) é válida de acordo com a lista de domínios.
         * @param targetSprite O Sprite principal da aplicação, usado para obter a URL de carregamento.
         * @return Retorna `true` se a localização for válida, `false` caso contrário.
         */
        public function validateLocation(targetSprite:Sprite):Boolean
        {
            var isLocalhostAllowed:Boolean = false;
            var isAnyDomainAllowed:Boolean = false;
            var allowedFullURLs:Array = [];
            var domainRegexParts:String = "";

            var swfURL:String = targetSprite.loaderInfo.loaderURL;
            var hostDomain:String = new LocalConnection().domain;
            var allowedDomainsList:Array = this.getDecryptedDomainList().split("|");

            // 1. Processa a lista de domínios descriptografada para criar regras.
            for each (var rule:String in allowedDomainsList)
            {
                var cleanRule:String = rule.toLocaleLowerCase();

                if (cleanRule == "?") {
                    isAnyDomainAllowed = true;
                } else if (cleanRule.indexOf("localhost") > -1) {
                    isLocalhostAllowed = true;
                } else if (cleanRule.indexOf("http:") == 0 || cleanRule.indexOf("https:") == 0) {
                    // Adiciona URLs completas a uma lista separada
                    allowedFullURLs.push(cleanRule);
                } else {
                    // Constrói uma parte da expressão regular para domínios (e subdomínios)
                    if (domainRegexParts != "") {
                        domainRegexParts += "|";
                    }
                    // Transforma "*.exemplo.com" em uma regex que aceita subdomínios.
                    var regexRule:String = cleanRule.replace("*.", "((\\w|-|_)+\\.)*");
                    domainRegexParts += regexRule;
                }
            }

            // 2. Executa as verificações de validação.

            // Se o SWF está em um ambiente local (localhost)
            if (hostDomain.toLowerCase() == "localhost")
            {
                if (isLocalhostAllowed || isAnyDomainAllowed) {
                    return true;
                } else {
                    // Efeito colateral: esconde o conteúdo se a validação falhar em localhost
                    targetSprite.width = 0;
                    targetSprite.height = 0;
                    return false;
                }
            }
            
            // Se houver domínios para verificar via Regex, testa a URL do SWF
            if (domainRegexParts.length > 0)
            {
                var domainRegex:RegExp = new RegExp("^https?://((www)+\\.)*(" + domainRegexParts + ")", "i");
                if (domainRegex.test(swfURL))
                {
                    return true;
                }
            }
            
            // Verifica se a URL do SWF corresponde a alguma das URLs completas permitidas
            for each (var allowedURL:String in allowedFullURLs)
            {
                if(swfURL.indexOf(allowedURL) == 0)
                {
                    return true;
                }
            }
            
            // Verificação final: se nenhuma regra de domínio ou URL foi definida,
            // a validação só passa se a regra "?" (qualquer domínio) foi encontrada.
            if (domainRegexParts.length == 0 && allowedFullURLs.length == 0) 
            {
                if (isAnyDomainAllowed) {
                    return true;
                }
            }

            // Se nenhuma das condições acima for satisfeita, a validação falha.
            // Efeito colateral: esconde o conteúdo.
            targetSprite.width = 0;
            targetSprite.height = 0;
            return false;
        }

        /**
         * Descriptografa a lista de domínios usando a chave embutida.
         * @return Uma string contendo a lista de domínios permitidos, separados por "|".
         */
        private function getDecryptedDomainList():String
        {
            // Instancia os assets embutidos
            var encryptedData: ByteArray = new this.EncryptedDomainListAsset() as ByteArray;
            var key: ByteArray = new this.DecryptionKeyAsset() as ByteArray;
            
            // A classe §_o_-__§ é o "descriptografador"
            var decryptor: RC4Cipher = new RC4Cipher(key);
            
            // O método §_o_-___-§ do descriptografador modifica o ByteArray 'encryptedData'
            decryptor.applyCipher(encryptedData);
            
            // Reseta a posição do cursor do ByteArray para o início
            encryptedData.position = 0;
            
            // Lê o conteúdo agora descriptografado como uma string UTF-8
            return encryptedData.readUTFBytes(encryptedData.length);
        }
    }

}