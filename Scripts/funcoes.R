# Este é um arquivo de encapsulamento de funções, para manter o código limpo e legível
#
# Função para verificar se o pacote está instalado e instalá-lo, caso seja necessário, em seguida carregá-lo
instalar_carregar <- function(pacote) {
  if (!require(pacote, character.only = TRUE)) {
    install.packages(pacote)
    library(pacote, character.only = TRUE)
  }
}
