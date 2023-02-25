## Fonte dos dados 

Os dados foram obtidos no sítio eletrônico da Câmara dos Deputados, na página <a href="https://dadosabertos.camara.leg.br/swagger/api.html">Dados Abertos</a>, seção Deputados.

## Coleta e pré-processamento dos dados

A coleta dos dados foi realizada via API disponibilizada pelo site da Câmara dos Deputados. Em seguida, os dados coletados foram tratados para pequenas correções e enriquecimento. Por fim, foram exportados para os arquivos "deputados2022.json" e "despesas2022.json", que também podem ser baixados da pasta "dados". 

Tais tarefas encontram-se descritas no arquivo "TranspCD2022.ipynb", o qual também está disponível no Google Colab por meio do link <a href="https://colab.research.google.com/drive/1KUTMeG-4TpZ_wmUNFSTCsm5P3a8h7SoC">Notebook TranspCD2022</a>.

## Análise e visualização dos dados

Os dados preparados no formato JSON foram importados para o Google Data Studio por intermédio de um conector JDBC. Os relatórios construídos para visualizar os resultados podem ser acessados de maneira interativa no link <a href="https://lookerstudio.google.com/reporting/3e51a065-a2ca-457b-838a-6a636c654641">Visual de Transparência da Câmara dos Deputados em 2022</a>.

Segue abaixo um resumo das informações apresentadas na análise: 

![slides_transpCD](https://user-images.githubusercontent.com/90117229/219652283-12d6bc93-cb37-4c8d-95fd-8cfc259bd2c2.gif)

