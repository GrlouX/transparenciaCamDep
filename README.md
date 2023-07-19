## Fonte dos dados 

Os dados foram obtidos no sítio eletrônico da Câmara dos Deputados, na página <a href="https://dadosabertos.camara.leg.br/swagger/api.html">Dados Abertos</a>, seção Deputados.

## Coleta e pré-processamento dos dados

A coleta dos dados foi realizada via API disponibilizada pelo site da Câmara dos Deputados. Em seguida, os dados coletados foram tratados para pequenas correções e enriquecimento. Por fim, os dados tratados foram exportados para os arquivos "deputados2022.json" e "despesas2022.json", que também podem ser baixados da pasta "dados". 

Tais tarefas encontram-se descritas no arquivo "TranspCD2022.ipynb", o qual também está disponível no Google Colab por meio do link <a href="https://colab.research.google.com/drive/1KUTMeG-4TpZ_wmUNFSTCsm5P3a8h7SoC">Notebook TranspCD2022</a>.

## Análise e visualização dos dados

Os dados preparados no formato JSON foram importados para o Looker Studio por intermédio de um conector JDBC. O painel construído para melhor visualizar os resultados pode ser acessado de maneira interativa através do link de acesso <a href="https://lookerstudio.google.com/s/qDilpukiu3E">Transparência na Câmara dos Deputados</a>.

Segue uma amostra visual dos resultados da análise: 

![Transparencia_Deputados_Federais](https://github-production-user-asset-6210df.s3.amazonaws.com/90117229/244875258-0a5f0012-447b-4f49-b207-674112b60f81.png)

