## Fonte dos dados 

Os dados foram obtidos no sítio eletrônico da Câmara dos Deputados, na página <a href="https://dadosabertos.camara.leg.br/swagger/api.html">Dados Abertos</a>, seção Deputados.

## Coleta e pré-processamento dos dados

A coleta dos dados foi realizada via API disponibilizada pelo site da Câmara dos Deputados. Em seguida, os dados coletados foram tratados para realizar correções e enriquecimento. Por fim, os dados tratados foram exportados para os arquivos "deputadosLEG57.json" e "despesasLEG57.json", que podem ser baixados da pasta "dados". 

Tais tarefas encontram-se descritas no arquivo "TranspCD.ipynb", o qual também está disponível no Google Colab por meio do link <a href="https://colab.research.google.com/drive/14RgdJu0FhZoGERn8oOv19_cytXauOSs5">Notebook TranspCD</a>.

## Análise e visualização dos dados

Os dados preparados no formato JSON foram importados para o Looker Studio por intermédio de um conector JDBC. O painel construído para melhor visualizar os resultados pode ser acessado de maneira interativa através do link de acesso <a href="https://lookerstudio.google.com/s/gyYKk43TJ8E">Transparência na Câmara dos Deputados</a>.

Segue uma amostra visual dos resultados da análise: 

![Transparencia_na Câmara dos Deputados](https://github.com/user-attachments/assets/db945494-52c9-43d8-8c67-534c71dca916)

