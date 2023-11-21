
==========================================================================================================================


/*

Name: Wagner
Description: Soma de valor de uma DE - tabela

*/

    use db_dermaclub;
select 
FORMAT(t.prospect_maior_que_720d+
       t.prospects720d+
       t.prospects360d+
       t.prospects180d+
       t.prospects90d+
       t.inativos720d+
       t.inativo390d+
       t.inativos540d+
       t.inativos_maior_que_720d+
       t.ativos90d+
       t.prechurn+
       t.retencao, 2)as Total,
       grupo,
       t.mes_ano
from dmc_de_novo_dados_transaction_dmc t 

where  t.grupo = 'TOTAL'

==========================================================================================================================
/*

Name: Wagner
Description: Soma de valor de uma DE - tabela e adicionando mesclagens

*/

select

mes_ano,
grupo,
MAX(prospect_maior_que_720d) + MAX(prospects720d) + MAX(prospects360d) + MAX(prospects180d) + MAX(prospects90d) as Prospects,

MAX(inativos720d) + MAX(inativo390d) + MAX(inativos540d) + MAX(inativos_maior_que_720d) as Inativos,

MAX(ativos90d) + MAX(retencao) + MAX(prechurn) as compradores12M,

MAX(prospect_maior_que_720d) + MAX(prospects720d) + MAX(prospects360d) + MAX(prospects180d) + MAX(prospects90d) + 
MAX(inativos720d) + MAX(inativo390d) + MAX(inativos540d) + MAX(inativos_maior_que_720d) + 
MAX(ativos90d) + MAX(prechurn) + MAX(retencao) as BaseTotal

from dmc_de_novo_dados_transaction_dmc

where mes_ano = "April 2023"

group by mes_ano,
grupo



==========================================================================================================================

/*

Name: Wagner
Description: Soma de valor de uma DE - tabela

*/

use db_dermaclub;
select 
FORMAT(t.novos + t.primeiracompra + t.recompradores+ t.retidos , 2)as Total,
       grupo,
       t.mes_ano
from dmc_de_novo_dados_transaction_dmc t 

where  t.grupo = 'TOTAL'

==========================================================================================================================


/*

Name: Wagner
Description: Query sobre Taxonomia dividindo hífen

*/


select 
SUM(ga_sessions) as ga_sessions,
SUM(ga_transactions) as ga_transactions,
SUM(ga_transactionrevenue) as ga_transactionrevenue,
(CASE when ga_sourcemedium like '%crm%' or 
           ga_sourcemedium like '%salesforce%' or 
           ga_sourcemedium like '%email%' then 'CRM' 
           when ga_sourcemedium like '%sms%' then 'SMS'
        else 'OutrosCanais'
      end) as CRMouSMS,
ga_campaign,
(CASE
    when ga_campaign like '%-reg%' then 'Jornada'
    when ga_campaign like '%xxxx%' then 'Jornada'
    when ga_campaign like '%-rea%' then 'Jornada'
    when ga_campaign like '%-reb%' then 'Jornada'
    when ga_campaign like '%-sms%' then 'SMS'
    when ga_campaign like '%-seg%' then 'Broadcast'
    when ga_campaign like '%-rep%' then 'Broadcast'
    when ga_campaign like '%-deseng%' then 'Broadcast'
    when ga_campaign like '%-temp%' then 'Broadcast'
    when ga_campaign like '%-tmp%' then 'Broadcast'
    when ga_campaign like '%-broad%' then 'Broadcast'
    when ga_campaign like '%_Seg%' then 'Broadcast'
    when ga_campaign like '%-borad%' then 'Broadcast'
    when ga_campaign like '%-brd%' then 'Broadcast'
    when ga_campaign like '%-bra%' then 'Broadcast'
    when ga_campaign like '%-brb%' then 'Broadcast'
    when ga_campaign like '%-sea%' then 'Broadcast'
    when ga_campaign like '%-seb%' then 'Broadcast'
    when ga_campaign like '%-ctr%' then 'Broadcast'
    when ga_campaign like '%-dng%' then 'Broadcast'
    when ga_campaign like '%-ert%' then 'Broadcast'  else 'Not Parametrized' 
END) as TypeGeneral,
(CASE
    when ga_campaign like '%-reg%' then 'Jornada'
    when ga_campaign like '%reg%' then 'Jornada'
    when ga_campaign like '%xxxx%' then 'Jornada'
    when ga_campaign like '%-rea%' then 'Jornada Teste A'
    when ga_campaign like '%-reb%' then 'Jornada Teste B'
    when ga_campaign like '%-sms%' then 'SMS'
    when ga_campaign like '%-seg%' then 'Segmentado'
    when ga_campaign like '%-rep%' then 'Repique'
    when ga_campaign like '%-deseng%' then 'Desengajado'
    when ga_campaign like '%-temp%' then 'Template'
    when ga_campaign like '%-tmp%' then 'Template'
    when ga_campaign like '%-broad%' then 'Broadcast'
    when ga_campaign like '%_Seg%' then 'Segmentado'
    when ga_campaign like '%-borad%' then 'Broadcast'
    when ga_campaign like '%-brd%' then 'Broadcast'
    when ga_campaign like '%-bra%' then 'Broadcast Teste A'
    when ga_campaign like '%-brb%' then 'Broadcast Teste B'
    when ga_campaign like '%-sea%' then 'Segmentado Teste A'
    when ga_campaign like '%-seb%' then 'Segmentado Teste B'
    when ga_campaign like '%-ctr%' then 'Grupo de Controle'
    when ga_campaign like '%-dng%' then 'Desengajado'
    when ga_campaign like '%-ert%' then 'Errata'  else 'Not Parametrized'
END) as TypeDetail,
(CASE
    when ga_campaign like '%-cr%' then 'Cerave'
    when ga_campaign like '%-lr%' then 'La Roche-Posay'
    when ga_campaign like '%-mm%' then 'Multimarcas'
    when ga_campaign like '%-sk%' then 'Skinceuticals'
    when ga_campaign like '%-vc%' then 'Vichy'
    when ga_campaign like '%-dc%' then 'Dermaclub'
    else 'Not Parametrized'
END) as Marca,
(CASE
    when ga_campaign like '%-ATT-PV%' then 'PANVEL'
    when ga_campaign like '%-ATT-SP%' then 'DROGRARIA SAO PAULO'
    when ga_campaign like '%-ATT-PT%' then 'FARMACIA PERMANENTE'
    when ga_campaign like '%-ATT-RD%' then 'RAIA DROGASIL S/A.'
    when ga_campaign like '%-ATT-CL%' then 'CLAMED FARMACIAS'
    when ga_campaign like '%-ATT-TM%' then 'DROGARIA TAMOIO'
    when ga_campaign like '%-ATT-PM%' then 'DROG.PAGUE MENOS'
    when ga_campaign like '%-ATT-NS%' then 'FARMACIA E DROGARIA NISSEI S.A'
    when ga_campaign like '%-ATT-PA%' then 'DROGARIA PACHECO'
    when ga_campaign like '%-ATT-IN%' then 'FARMACIA INDIANA'
    when ga_campaign like '%-ATT-SJ%' then 'FARMACIAS SÃO JOÃO'
    when ga_campaign like '%-ATT-SK%' then 'E-BOUTIQUE SKC'
    when ga_campaign like '%-ATT-VN%' then 'GRUPO VENANCIO'
    when ga_campaign like '%-ATT-ML%' then 'D1000'
    when ga_campaign like '%-ATT-EK%' then 'EPOCA COSMETICOS'
    when ga_campaign like '%-ATT-FT%' then 'DROGAL FARMACEUTICA'
    when ga_campaign like '%-ATT-RS%' then 'DROGARIA ROSARIO'
    when ga_campaign like '%-ATT-EX%' then 'EXTRAFARMA'
    when ga_campaign like '%-D2C-DC%' then 'D2C DERMACLUB'
    else 'Not Parametrized'
END) as Rede,

(CASE
    when ga_campaign like '%-mc%' then 'Cerave'
    when ga_campaign like '%-ar%' then 'La Roche-Posay'
    when ga_campaign like '%-cp%' then 'Multimarcas'
    when ga_campaign like '%-hd%' then 'Skinceuticals'
    when ga_campaign like '%-lp%' then 'Vichy'
    when ga_campaign like '%-mc%' then 'Dermaclub'
    when ga_campaign like '%-sl%' then 'Dermaclub'
    when ga_campaign like '%-am%' then 'Dermaclub'
    when ga_campaign like '%-aa%' then 'Dermaclub'
    when ga_campaign like '%-vc%' then 'Dermaclub'
    when ga_campaign like '%-pq%' then 'Dermaclub'
    else 'Not Parametrized'
END) as Categoria,

ga_sourcemedium,
ga_adcontent,
ga_devicecategory,
CAST(ga_date as DATE) as ga_date,
ga_channelgrouping

from dmc_ga_campaigns_full

group by
ga_campaign,
ga_sourcemedium,
ga_adcontent,
ga_devicecategory,
ga_date,
ga_channelgrouping,
CRMouSMS,TypeDetail,TypeGeneral

order by ga_date DESC
==========================================================================================================================



select 
ga_campaign,
substring_index(ga_campaign, '-', -1) as firstName,
substring_index(ga_campaign, '_', 3) as SecondtName
from dmc_ga_campaigns_full
where (ga_sourcemedium like '%crm%' or ga_sourcemedium like '%salesforce%' or ga_sourcemedium like '%email%')
and ga_campaign like '%ADP%'

==========================================================================================================================

show grants

==========================================================================================================================
https://sebhastian.com/mysql-split-string/


==========================================================================================================================

https://learn.microsoft.com/pt-br/power-bi/fundamentals/desktop-latest-update-archive?tabs=powerbi-desktop




==========================================================================================================================

querys oara consulta de jornadas



SELECT * FROM `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas`  where Codigo = 'ssc_othr_aviseme_xxxxxx-br-dpp-b2c-sds-procedure-visitrecovery-aviseme-reg'

---------------------------

select 
       SUM(ga_sessions), 
       SUM(ga_transactions), 
       SUM(ga_transactionrevenue), 
       lower(TRIM(ga_campaign)) as campaign, 
       j.Codigo,
       CrmOuSms,
       ga_date 
       from `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as g
       left join `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
       on lower(TRIM(g.ga_campaign)) = lower(TRIM(j.Codigo))


       where (lower(TRIM(ga_campaign)) like '%-reg_%' or lower(TRIM(ga_campaign)) like '%-rea_%' or lower(TRIM(ga_campaign)) like '%-reb_%' or lower(TRIM(ga_campaign)) like '%xxxx%')
      and lower(TRIM(ga_campaign)) = 'ssc_othr_aviseme_xxxxxx-br-dpp-b2c-sds-procedure-visitrecovery-aviseme-reg'

       group by ga_campaign,
        CrmOuSms,
       ga_date,j.Codigo


---------------------------


       select s.send_date, 
       s.journey_name, 
       j.Codigo,
       case when lower(TRIM(s.journey_name)) = lower(TRIM(j.Codigo)) then j.Codigo 
            when lower(TRIM(s.journey_name)) = 'n/a' then 'Sem Jornada' else 'Verificar' end as validacaoJornada,
       #g.ga_campaign,
       SUM(s.sends) as sends,
       SUM(s.deliveries) as deliveries, 
       SUM(s.uniqueClicks) as uniqueClicks, 
       SUM(s.uniqueOpens) as uniqueOpens, 
       SUM(s.uniqueUnsubscribes) as uniqueUnsubscribes, 
       SUM(s.bounces) as bounces

from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as s
full join `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
on lower(TRIM(s.journey_name)) = lower(TRIM(j.Codigo))
#left join `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as g
#on lower(TRIM(j.Codigo)) = lower(TRIM(g.ga_campaign)) 

#where g.ga_campaign is not null

group by s.journey_name,j.Codigo,s.send_date# ,g.ga_campaign


---------------------------

select 
send_date,
horaDisparo,
emailname
journey
from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` 







==================================================================================================================================================================================
==================================================================================================================================================================================
==================================================================================================================================================================================
==================================================================================================================================================================================



CONVERSÃO DE ARQUIVO UTF-16 P/ UTF-8 EM NODE.JS



1. Instalar o node na máquina
2. Abrir o terminal
3. Digite npm install incov-lite
4. Digite npm install csv-parser
5. Navegue até o diretório do arquivo para iniciar a conversão.
6. Crie um arquivo chamado conversao.js com as informações:


const iconv = require('iconv-lite')
const fs = require("fs");
let teste = async function () {
    let data = fs.createReadStream("./Arquivo-utf16.csv");

   data.pipe(iconv.decodeStream('utf16'))
        .pipe(iconv.encodeStream('utf8'))
.pipe(fs.createWriteStream("./Arquivo-utf8.csv"));
 
  return console.log('[WARNING] - Arquivo convertido');
}
teste();


7. Execute o comando: node conversao.js
    Após isso, vai converter o arquivo em um outro arquivo no formato CSV UTF-8 com a meta do tamanho do arquivo original.


8. Se por acaso queira ler a qtde de linhas, criei um arquivo chamado Leitura.js e cole o seguinte código no arquivo:

const fs = require('fs');
const csv = require('csv-parser');

const filePath = './Arquivo.csv';
let lineCount = 0;

fs.createReadStream(filePath)
  .pipe(csv())
  .on('data', () => {
    lineCount++;
  })
  .on('end', () => {
    console.log('O arquivo possui', lineCount, 'linhas.');
  })
  .on('error', (err) => {
    console.error('Ocorreu um erro ao ler o arquivo:', err);
  });

9. Execute o comando: node Leitura.js
10. Aqui ele vai começar a contar a quantidade de linhas que tem no arquivo. Você pode fazer isso no arquivo original e também no arquivo convertido.



==================================================================================================================================================================================
==================================================================================================================================================================================
==================================================================================================================================================================================
==================================================================================================================================================================================
==================================================================================================================================================================================




select distinct
case when trim(sendsfull.emailname) = 'der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg'  then 'der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg'  then 'der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg'  then 'der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg'  then 'der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg'  then 'der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-semstep-reg'
     when trim(sendsfull.emailname) = 'der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg'  then 'der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg'  then 'der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg'  then 'der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg' then 'der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg' then 'der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-step1-reg'  then 'der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-semstep-reg'
     when trim(sendsfull.emailname) = 'der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-reg'  then 'der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg'  then 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step5-reg'  then 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg'
     when trim(sendsfull.emailname) = 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step6-reg'  then 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg'  then 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg'
     when trim(sendsfull.emailname) = 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-reg'  then 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-reg'  then 'der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-step1-reg'
     when trim(sendsfull.emailname) = 'AAL5_DMC_BRA_abandonecart-stp3-reg_2_2022'  then 'AAL5_DMC_BRA_abandonecart-step2-reg_2_2022'
     when trim(sendsfull.emailname) = 'der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-reg'  then 'der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-reg'  then 'der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-semstep-reg'
     when trim(sendsfull.emailname) = 'der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-reg'  then 'der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-rep-reg'  then 'der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-reg'  then 'der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-reg'  then 'der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-rep-reg'  then 'der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-reg'  then 'der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg'  then 'der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg'  then 'der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-reg'  then 'der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-rep-reg' then 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg'
     when trim(sendsfull.emailname) = 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-rep-reg' then 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg'
     when trim(sendsfull.emailname) = 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-reg' then 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-reg' then 'der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-reg' then 'der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-reg' then 'der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-reg' then 'der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-reg' then 'der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-rep-reg' then 'der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-reg' then 'der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-reg' then 'der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-reg' then 'der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-reg' then 'der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-reg' then 'der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-reg' then 'der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-reg' then 'der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-02-reg' then 'der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-03-reg' then 'der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step2-reg'
     when trim(sendsfull.emailname) = 'der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-reg' then 'der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-step1-reg'
     when trim(sendsfull.emailname) = 'der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-rep-reg' then 'der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step4-reg'
     when trim(sendsfull.emailname) = 'AAO9_DMC_BRA_recompra-stp-refil-reg_1_2022' then 'AAO9_DMC_BRA_recompra-stp-refil-step3-reg_1_2022'
     when trim(sendsfull.emailname) = 'AAP1_DMC_BRA_recompra-stp-minis-reg_1_2022' then 'AAP1_DMC_BRA_recompra-stp-minis-step3-reg_1_2022'
     when trim(sendsfull.emailname) = 'der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-reg' then 'der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa' then 'der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa-stepzicard'
     when trim(sendsfull.emailname) = 'der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-reg' then 'der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-step1-reg'
     when trim(sendsfull.emailname) = 'ACR2_DMC_BRA_ultracover-stp4m2200-reg_1_2023' then 'ACR2_DMC_BRA_ultracover-stp4m2200-semstep-reg_1_2023'
     when trim(sendsfull.emailname) = 'ACR2_DMC_BRA_ultracover-stp4-2200-reg_1_2023' then 'ACR2_DMC_BRA_ultracover-stp4-2200-step4-reg_1_2023'
     when trim(sendsfull.emailname) = 'ACR3_DMC_BRA_ultracover-stp4-2200-reg_1_2023' then 'ACR3_DMC_BRA_ultracover-stp4-2200-semstep-reg_1_2023'
     when trim(sendsfull.emailname) = 'AAD1_LRP_BRA_ultracover-stp4m2200-reg_1_2023' then 'AAD1_LRP_BRA_ultracover-stp4m2200-step4-reg_1_2023'
     when trim(sendsfull.emailname) = 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-reg' then 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-stepzicard-reg'
     when trim(sendsfull.emailname) = 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-reg' then 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-stepzicard-reg'
     else trim(sendsfull.emailname)
end as dCampanha,
MAX(sendsfull.subject) as subject,
MAX(sendsfull2.previewurl) as previewurl,
(case when MAX(ga2.smedium) is null then 'crm / email' else MAX(ga2.smedium) end) as sourcemedium,
(case when MAX(ga2.cgrouping) is null then 'Email' else MAX(ga2.cgrouping) end) as channelgrouping,
j.Lista as jornadaAgrupada, 
j.Cluster as tipoJornada, 
dicionario_rede.Lista as rede,
dicionario_marca.Lista as marca,
dicionario_categoria.Lista as categoria,
dicionario_tema.Lista as tema,
dicionario_exclusividade.Lista as exclusividade,
dicionario_segmentacao.Lista as segmentacao,
dicionario_tipo.Lista as tipo


from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as sendsfull
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_rede
on lower(sendsfull.rede) = dicionario_rede.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_marca
on lower(sendsfull.marca) = dicionario_marca.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_categoria
on lower(sendsfull.categoria) = dicionario_categoria.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_tema
on lower(sendsfull.tema) = dicionario_tema.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_exclusividade
on lower(sendsfull.exclusividade) = dicionario_exclusividade.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_segmentacao
on lower(sendsfull.segmentacao) = dicionario_segmentacao.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_tipo
on lower(sendsfull.tipo) = dicionario_tipo.Codigo
left join (
  select   teste.emailname,
           MAX(teste.previewurl) as previewurl 
  from     `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` teste
  group by 1
) AS sendsfull2 ON sendsfull.emailname = sendsfull2.emailname
left join `enext-datarepository.loreal_dca.dmc_dicionario_jornadas` as j
on lower(TRIM(sendsfull.emailname)) = lower(TRIM(j.Codigo))
left join (
  select
    MAX(gg.ga_sourcemedium) as smedium,
    MAX(gg.ga_channelgrouping) as cgrouping,
    gg.ga_campaign as campaign
  from `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as gg
  group by 3   
) as ga2 on lower(trim(ga2.campaign)) = lower(trim(sendsfull.emailname))

where sendsfull.send_date is not NULL 
and sendsfull.send_date >= '2022-01-01'

group by 1,6,7,8,9,10,11,12,13,14


UNION ALL


select distinct
case when trim(g.ga_campaign) = 'der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg'  then 'der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg'  then 'der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg'  then 'der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg'  then 'der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg'  then 'der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-semstep-reg'
     when trim(g.ga_campaign) = 'der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg'  then 'der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg'  then 'der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg'  then 'der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg' then 'der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg' then 'der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-step1-reg'  then 'der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-semstep-reg'
     when trim(g.ga_campaign) = 'der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-reg'  then 'der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg'  then 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step5-reg'  then 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg'
     when trim(g.ga_campaign) = 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step6-reg'  then 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg'  then 'der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg'
     when trim(g.ga_campaign) = 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-reg'  then 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-reg'  then 'der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-step1-reg'
     when trim(g.ga_campaign) = 'AAL5_DMC_BRA_abandonecart-stp3-reg_2_2022'  then 'AAL5_DMC_BRA_abandonecart-step2-reg_2_2022'
     when trim(g.ga_campaign) = 'der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-reg'  then 'der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-reg'  then 'der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-semstep-reg'
     when trim(g.ga_campaign) = 'der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-reg'  then 'der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-rep-reg'  then 'der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-reg'  then 'der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-reg'  then 'der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-rep-reg'  then 'der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-reg'  then 'der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg'  then 'der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg'  then 'der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-reg'  then 'der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-rep-reg' then 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg'
     when trim(g.ga_campaign) = 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-rep-reg' then 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg'
     when trim(g.ga_campaign) = 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-reg' then 'der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-reg' then 'der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-reg' then 'der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-reg' then 'der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-reg' then 'der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-reg' then 'der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-rep-reg' then 'der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-reg' then 'der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-reg' then 'der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-reg' then 'der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-reg' then 'der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-reg' then 'der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-reg' then 'der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-reg' then 'der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-02-reg' then 'der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-03-reg' then 'der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step2-reg'
     when trim(g.ga_campaign) = 'der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-reg' then 'der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-step1-reg'
     when trim(g.ga_campaign) = 'der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-rep-reg' then 'der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step4-reg'
     when trim(g.ga_campaign) = 'AAO9_DMC_BRA_recompra-stp-refil-reg_1_2022' then 'AAO9_DMC_BRA_recompra-stp-refil-step3-reg_1_2022'
     when trim(g.ga_campaign) = 'AAP1_DMC_BRA_recompra-stp-minis-reg_1_2022' then 'AAP1_DMC_BRA_recompra-stp-minis-step3-reg_1_2022'
     when trim(g.ga_campaign) = 'der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-reg' then 'der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa' then 'der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa-stepzicard'
     when trim(g.ga_campaign) = 'der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-reg' then 'der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-step1-reg'
     when trim(g.ga_campaign) = 'ACR2_DMC_BRA_ultracover-stp4m2200-reg_1_2023' then 'ACR2_DMC_BRA_ultracover-stp4m2200-semstep-reg_1_2023'
     when trim(g.ga_campaign) = 'ACR2_DMC_BRA_ultracover-stp4-2200-reg_1_2023' then 'ACR2_DMC_BRA_ultracover-stp4-2200-step4-reg_1_2023'
     when trim(g.ga_campaign) = 'ACR3_DMC_BRA_ultracover-stp4-2200-reg_1_2023' then 'ACR3_DMC_BRA_ultracover-stp4-2200-semstep-reg_1_2023'
     when trim(g.ga_campaign) = 'AAD1_LRP_BRA_ultracover-stp4m2200-reg_1_2023' then 'AAD1_LRP_BRA_ultracover-stp4m2200-step4-reg_1_2023'
     when trim(g.ga_campaign) = 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-reg' then 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-stepzicard-reg'
     when trim(g.ga_campaign) = 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-reg' then 'der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-stepzicard-reg'
     else trim(g.ga_campaign)
end as dCampanha,
MAX(url.p_subject) as subject,
  MAX(url.p_url) as previewurl,
(case when MAX(ga2.smedium) is null then 'crm / email' else MAX(ga2.smedium) end) as sourcemedium,
(case when MAX(ga2.cgrouping) is null then 'Email' else MAX(ga2.cgrouping) end) as channelgrouping,
  j.Lista as jornadaAgrupada, 
  j.Cluster as tipoJornada,
  dicionario_rede.Lista as rede,
  dicionario_marca.Lista as marca,
  dicionario_categoria.Lista as categoria,
  dicionario_tema.Lista as tema,
  dicionario_exclusividade.Lista as exclusividade,
  dicionario_segmentacao.Lista as segmentacao,
  dicionario_tipo.Lista as tipo
  
from `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as g
left join `enext-datarepository.loreal_dca.dmc_dicionario_jornadas` as j
on lower(trim(g.ga_campaign)) = lower(trim(j.Codigo))
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_rede
on lower(g.rede) = dicionario_rede.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_marca
on lower(g.marca) = dicionario_marca.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_categoria
on lower(g.categoria) = dicionario_categoria.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_tema
on lower(g.tema) = dicionario_tema.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_exclusividade
on lower(g.exclusividade) = dicionario_exclusividade.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_segmentacao
on lower(g.segmentacao) = dicionario_segmentacao.Codigo
left join `enext-datarepository.loreal_dca.dmc_dicionario` as dicionario_tipo
on lower(g.tipo) = dicionario_tipo.Codigo
left join (
  select MAX(ss.previewurl) as p_url,
         MAX(ss.subject) as p_subject,
         ss.emailname
  from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as ss
  group by 3
) as url on lower(trim(url.emailname)) = lower(trim(g.ga_campaign))
left join (
  select
    MAX(gg.ga_sourcemedium) as smedium,
    MAX(gg.ga_channelgrouping) as cgrouping,
    gg.ga_campaign as campaign
  from `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as gg
  group by 3   
) as ga2 on lower(trim(ga2.campaign)) = lower(trim(g.ga_campaign))

where g.ga_date is not NULL 
and g.ga_date >= '2022-01-01'

group by 1,6,7,8,9,10,11,12,13,14























ADP1_DMC_BRA_ D2C-DC   -MM     -MC         -02    -N              -001          -BRD     _1_2023
Código        Rede     Marca   Categoria   Tema   Exclusividade   Segmentacao   Tipo








======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================


select 
sends.send_date,
sends.email_name,
sends.journey_name,
sends.Email_Subject,
SUM(sends.sends) as sends,
SUM(sends.deliveries) as deliveries,
SUM(sends.unique_clicks) as uniqueClicks,
SUM(sends.unique_opens) as uniqueOpens,
SUM(sends.unique_unsubscribes) as uniqueSubscribes,
SUM(sends.bounces) as bounces


from `enext-datarepository.loreal_dca.dmc_sfmc_sends` as sends

where send_date = 2023-05-07
and sends.email_name = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg

group by 1,2,3,4



======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================



tabela Fato do GA Full

Consulta programada: Lorea_Dca_Dmc_Fato_Campaign
Tabela de inserção: dmc_ga_campaign_full
horário: 10:00 para atualização

select
    SUM(novo.ga_sessions) as ga_sessions,
    SUM(novo.ga_transactions) as ga_transactions,
    SUM(novo.ga_transactionrevenue) as ga_transactionrevenue,
    SUM(novo.ga_itemquantity) as ga_itemquantity,
    TRIM(novo.ga_campaign) as ga_campaign,
    novo.ga_sourcemedium as ga_sourcemedium,
    CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) as ga_date,
    novo.ga_channelgrouping as ga_channelgrouping,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 2 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(1)], r[^_]+) ELSE NULL END as rede,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 3 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(2)], r[^_]+) ELSE NULL END as marca,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 4 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(3)], r[^_]+) ELSE NULL END as categoria,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 5 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(4)], r[^_]+) ELSE NULL END as tema,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 6 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(5)], r[^_]+) ELSE NULL END as exclusividade,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 7 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(6)], r[^_]+) ELSE NULL END as segmentacao,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 8 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(7)], r[^_]+) ELSE NULL END as tipo
from
    `enext-datarepository.loreal_dca.dmc_ga_campaigns_novo` as novo
where
    CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-04-26

group by 
    novo.ga_sessions,
    novo.ga_transactions,
    novo.ga_transactionrevenue,
    novo.ga_itemquantity,
    novo.ga_campaign,
    novo.ga_sourcemedium,
    novo.ga_date,
    novo.ga_channelgrouping,
    rede,
    marca,
    categoria,
    tema,
    exclusividade,
    segmentacao,
    tipo

    UNION ALL

    select
    SUM(antigo.ga_sessions) as ga_sessions,
    SUM(antigo.ga_transactions) as ga_transactions,
    SUM(antigo.ga_transactionrevenue) as ga_transactionrevenue,
    SUM(antigo.ga_itemquantity) as ga_itemquantity,
    TRIM(antigo.ga_campaign) as ga_campaign,
    antigo.ga_sourcemedium as ga_sourcemedium,
    CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) as ga_date,
    antigo.ga_channelgrouping as ga_channelgrouping,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 2 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(1)], r[^_]+) ELSE NULL END as rede,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 3 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(2)], r[^_]+) ELSE NULL END as marca,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 4 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(3)], r[^_]+) ELSE NULL END as categoria,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 5 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(4)], r[^_]+) ELSE NULL END as tema,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 6 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(5)], r[^_]+) ELSE NULL END as exclusividade,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 7 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(6)], r[^_]+) ELSE NULL END as segmentacao,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 8 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(7)], r[^_]+) ELSE NULL END as tipo
from
    `enext-datarepository.loreal_dca.dmc_ga_campaigns_antigo` as antigo
where
    CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) <= 2023-04-25

group by
    antigo.ga_sessions,
    antigo.ga_transactions,
    antigo.ga_transactionrevenue,
    antigo.ga_itemquantity,
    antigo.ga_campaign,
    antigo.ga_sourcemedium,
    antigo.ga_date,
    antigo.ga_channelgrouping,
    rede,
    marca,
    categoria,
    tema,
    exclusividade,
    segmentacao,
    tipo  








======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================




tabela Fato do GA Full Sem Data

Consulta programada: Lorea_Dca_Dmc_Fato_Campaign_SemData
Tabela de inserção: dmc_ga_campaign_full_semData
horário: 10:00 para atualização

select
    SUM(novo.ga_sessions) as ga_sessions,
    SUM(novo.ga_transactions) as ga_transactions,
    SUM(novo.ga_transactionrevenue) as ga_transactionrevenue,
    SUM(novo.ga_itemquantity) as ga_itemquantity,
    TRIM(novo.ga_campaign) as ga_campaign,
    novo.ga_sourcemedium as ga_sourcemedium,
    novo.ga_channelgrouping as ga_channelgrouping,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 2 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(1)], r[^_]+) ELSE NULL END as rede,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 3 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(2)], r[^_]+) ELSE NULL END as marca,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 4 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(3)], r[^_]+) ELSE NULL END as categoria,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 5 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(4)], r[^_]+) ELSE NULL END as tema,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 6 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(5)], r[^_]+) ELSE NULL END as exclusividade,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 7 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(6)], r[^_]+) ELSE NULL END as segmentacao,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 8 and novo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(7)], r[^_]+) ELSE NULL END as tipo
from
    `enext-datarepository.loreal_dca.dmc_ga_campaigns_novo` as novo
where
    CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-04-26

group by 
    novo.ga_sessions,
    novo.ga_transactions,
    novo.ga_transactionrevenue,
    novo.ga_itemquantity,
    novo.ga_campaign,
    novo.ga_sourcemedium,
    novo.ga_date,
    novo.ga_channelgrouping,
    rede,
    marca,
    categoria,
    tema,
    exclusividade,
    segmentacao,
    tipo

    UNION ALL

    select
    SUM(antigo.ga_sessions) as ga_sessions,
    SUM(antigo.ga_transactions) as ga_transactions,
    SUM(antigo.ga_transactionrevenue) as ga_transactionrevenue,
    SUM(antigo.ga_itemquantity) as ga_itemquantity,
    TRIM(antigo.ga_campaign) as ga_campaign,
    antigo.ga_sourcemedium as ga_sourcemedium,
    antigo.ga_channelgrouping as ga_channelgrouping,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 2 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(1)], r[^_]+) ELSE NULL END as rede,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 3 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(2)], r[^_]+) ELSE NULL END as marca,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 4 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(3)], r[^_]+) ELSE NULL END as categoria,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 5 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(4)], r[^_]+) ELSE NULL END as tema,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 6 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(5)], r[^_]+) ELSE NULL END as exclusividade,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 7 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(6)], r[^_]+) ELSE NULL END as segmentacao,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 8 and antigo.ga_campaign like AD% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(7)], r[^_]+) ELSE NULL END as tipo
from
    `enext-datarepository.loreal_dca.dmc_ga_campaigns_antigo` as antigo
where
    CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) <= 2023-04-25

group by
    antigo.ga_sessions,
    antigo.ga_transactions,
    antigo.ga_transactionrevenue,
    antigo.ga_itemquantity,
    antigo.ga_campaign,
    antigo.ga_sourcemedium,
    antigo.ga_date,
    antigo.ga_channelgrouping,
    rede,
    marca,
    categoria,
    tema,
    exclusividade,
    segmentacao,
    tipo



======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================


MODELOS DE REGEXP


#REGEXP_EXTRACT_ALL(sends.email_name, [A-Za-z]+-[A-Za-z]+-) as teste
#REGEXP_EXTRACT(REGEXP_REPLACE(sends.email_name, _, -), r^([^_]+)-?([^_]+)?-?([^_]+)?-?([^_]+)?-?([^_]+)?-?([^_]+)?-?([^_]+)?$) as part1
#IFNULL(SPLIT(REGEXP_EXTRACT((sends.email_name, -), r^([^-]+)-?([^-]+)?-?([^-]+)?-?([^-]+)?-?([^-]+)?-?([^-]+)?-?([^-]+)?$), [,,,,,,])[OFFSET(0)] as part1
#IFNULL(REGEXP_EXTRACT(SPLIT(sends.email_name,-)[OFFSET(2)], r[^_]+),"") as marca,
#REGEXP_EXTRACT(REGEXP_REPLACE(sends.email_name, r-, -), r[^-]+, 2) as part1,
#REGEXP_EXTRACT(SPLIT(sends.email_name,-)[6], r[^_]+) as rede
#CASE WHEN ARRAY_LENGTH(SPLIT(sends.email_name, -)) >= 1 = SPLIT(sends.email_name, -)[OFFSET(0)] ELSE  END as part1,
#REGEXP_EXTRACT(SPLIT(sends.email_name,-)[OFFSET(1)], r[^_]+) as rede,
#REGEXP_EXTRACT(SPLIT(sends.email_name,-)[OFFSET(2)], r[^_]+) as marca,
#REGEXP_EXTRACT(SPLIT(sends.email_name,-)[OFFSET(3)], r[^_]+) as categoria,
#REGEXP_EXTRACT(SPLIT(sends.email_name,-)[OFFSET(4)], r[^_]+) as tema,
#REGEXP_EXTRACT(SPLIT(sends.email_name,-)[OFFSET(5)], r[^_]+) as Exclusividade,
#REGEXP_EXTRACT(SPLIT(sends.email_name,-)[OFFSET(6)], r[^_]+) as Segmentacao,
#REGEXP_EXTRACT(SPLIT(sends.email_name,-)[OFFSET(7)], r[^_]+) as Tipo,


======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================

#QUERY PARA CONSULTA DENTRO DO BQ EXTRAINDO TEMAS DE CADA OPÇÃO DA UTM DE DERMACLUB 

Consulta programada: Loreal_Dca_Dmc_Fato_Sends
Tabela de inserção: dmc_sfmc_sends_full
horário: 10:00 para atualização


select 
sends.send_date,
case when TRIM(sends.email_name) = TRANSACTIONALS_ORDERNOTIFICATION_REDEMPTION_ACD_LTY_TRANS_Redemption = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-reg 
     when TRIM(sends.email_name) = TRANSACTIONALS_ORDERNOTIFICATION_ACD_LTY_TRANS_Purchase = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_ORDERNOTIFICATION_ITEM_RETRIEVED_ACD_LTY_TRANS_RetrievedItems = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_DOUBLE_OPTIN_ACD_LTY_TRANS_Opt_in_ConfirmEmail = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_MGM_NOTIFIED_ACD_LTY_TRANS_MGM_Recommended_Notified = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_MGM_PURCHASEMADE_ACD_LTY_TRANS_MGM_Purchase_Made = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_OPTOUT_ACD_LTY_TRANS_OptOut = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_WELCOME_ACD_LTY_TRANS_Welcome = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_RESET_MY_PASSWORD_ACD_LTY_TRANS_Reset-PAcesso = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_POINTS_EXPIRATION_NOBALANCE_ACD_LTY_TRANS_PointsExpirationNOBalance = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_POINTS_EXPIRATION_ACD_LTY_TRANS_PointsExpiration = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-reg
     when TRIM(sends.email_name) = TRANSACTIONALS_MGM_RECEIVED_ACD_LTY_TRANS_MGM_Received = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-reg
     when TRIM(sends.email_name) = ADG7_DMC_BRA_antirru-dormantsinati-seg_1_2023 = ADG7_DMC_BRA_antirru-dormantsinati-seg_1_2023 
     when TRIM(sends.email_name) = ADG5_DMC_BRA_bodyhydr-dormantsativ-seg_1_2023 = ADG5_DMC_BRA_bodyhydr-dormantsativ-seg_1_2023 
     when TRIM(sends.email_name) = ADD1_DMC_BRA_resgate-engajados180d-seg_1_2023 = ADC9_DMC_BRA_pesq-compraultracover-seg_1_2023
     when TRIM(sends.email_name) = prueba 1 esther = prueba 1 esther 
     when TRIM(sends.email_name) = 462399_SEM_UTM = ACP7_DMC_BRA_pesquisa-dercos-seg_1_2023
     when TRIM(sends.email_name) = ACC1_DMC_BRA_m89-cat-seg_1_2022 = ACC1_DMC_BRA_m89-cat-seg_1_2022 
     when TRIM(sends.email_name) = ABG6_DMC_BRA_ath-fluid-brind-tkmal-seg_1_2022 = ABG6_DMC_BRA_ath-fluid-brind-tkmal-seg_1_2022 
     when TRIM(sends.email_name) = ABD7_DMC_BRA_pesqcicaplast-comp12m-seg_1_2022 = ABD7_DMC_BRA_pesqcicaplast-comp12m-seg_1_2022 
     when TRIM(sends.email_name) = ABB8_DMC_BRA_diaD-brinde-eng180-broad_1_2022 = ABB8_DMC_BRA_diaD-brinde-eng180-broad_1_2022  
     when TRIM(sends.email_name) = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-reg = antigo_der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-reg 
     when TRIM(sends.email_name) = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-rep-reg = antigo_der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-reg 
     when TRIM(sends.email_name) = der_othr_comprecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-rep-reg = der_othr_comprecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-reg 
     when TRIM(sends.email_name) = der_othr_compunico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-rep-reg = der_othr_compunico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-reg 
     when TRIM(sends.email_name) = der_othr_engsemcompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engsemcompra-step1-rep-reg = der_othr_engsemcompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engsemcompra-step1-reg 
     when TRIM(sends.email_name) = der_othr_navnaocomp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-reg = der_othr_navnaocomp_xxxxxx-br-acd-b2c-der-procedure-rreplenishment-customers-nav-nao-comp-reg 
     when TRIM(sends.email_name) = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-rep-reg = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-reg 
     else TRIM(sends.email_name) END as emailname,

  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 2 and sends.email_name like AD% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(1)], r[^_]+) ELSE NULL END as rede,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 3 and sends.email_name like AD% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(2)], r[^_]+) ELSE NULL END as marca,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 4 and sends.email_name like AD% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(3)], r[^_]+) ELSE NULL END as categoria,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 5 and sends.email_name like AD% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(4)], r[^_]+) ELSE NULL END as tema,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 6 and sends.email_name like AD% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(5)], r[^_]+) ELSE NULL END as exclusividade,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 7 and sends.email_name like AD% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(6)], r[^_]+) ELSE NULL END as segmentacao,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 8 and sends.email_name like AD% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(7)], r[^_]+) ELSE NULL END as tipo,

kondado.previewurl,
sends.journey_name,
sends.Email_Subject as subject,
SUM(sends.sends) as sends,
SUM(sends.deliveries) as deliveries,
SUM(sends.unique_clicks) as uniqueClicks,
SUM(sends.unique_opens) as uniqueOpens,
SUM(sends.unique_unsubscribes) as uniqueUnsubscribes,
SUM(sends.bounces) as bounces

from `enext-datarepository.loreal_dca.dmc_sfmc_sends` as sends
left join `enext-datarepository.loreal_dca.dmc_sfmc_sends_kondado` as kondado on cast(kondado.id as INT64) = sends.job_ID

group by 1,2,3,4,5,6,7,8,9,10,11,12

order by 1 desc


#FORMAT_TIME(%R, TIME(TIMESTAMP(kondado.senddate) - INTERVAL 3 HOUR)) AS horaDisparo,


======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================

Consulta Programada: Loreal_Dca_Dmc_Sends_Estruturado
Tabela de inserção: dmc_sfmc_sends_estruturado
horário: 10:30 para atualização

select 
sendsfull.send_date,
sendsfull.emailname as emailname,
sendsfull.subject,
j.Lista as jornadaAgrupada, 
j.Cluster as tipoJornada, 
dicionario_rede.Lista as rede,
dicionario_marca.Lista as marca,
dicionario_categoria.Lista as categoria,
dicionario_tema.Lista as tema,
dicionario_exclusividade.Lista as exclusividade,
dicionario_segmentacao.Lista as segmentacao,
dicionario_tipo.Lista as tipo,
sendsfull2.previewurl,
SUM(sends) as sends,
SUM(deliveries) as deliveries,
SUM(uniqueOpens) as uniqueOpens,
SUM(uniqueClicks) as uniqueClicks,
SUM(uniqueUnsubscribes) as uniqueUnsubscribes,
SUM(bounces) as bounces 


from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as sendsfull
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_rede
on lower(sendsfull.rede) = dicionario_rede.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_marca
on lower(sendsfull.marca) = dicionario_marca.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_categoria
on lower(sendsfull.categoria) = dicionario_categoria.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tema
on lower(sendsfull.tema) = dicionario_tema.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_exclusividade
on lower(sendsfull.exclusividade) = dicionario_exclusividade.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_segmentacao
on lower(sendsfull.segmentacao) = dicionario_segmentacao.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tipo
on lower(sendsfull.tipo) = dicionario_tipo.Codigo
LEFT JOIN (
  SELECT
    teste.send_date,
    teste.emailname,
    MAX(teste.previewurl) as previewurl 
  FROM
   `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` teste
  GROUP BY
    teste.send_date,
    teste.emailname
) AS sendsfull2 ON sendsfull.send_date = sendsfull2.send_date AND sendsfull.emailname = sendsfull2.emailname

left join `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
on lower(TRIM(sendsfull.emailname)) = lower(TRIM(j.Codigo))



where sendsfull.send_date is not NULL 
and sendsfull.send_date >= 2022-01-01
and sendsfull.deliveries > 1

group by 
send_date,
emailname,
sendsfull.subject,
dicionario_rede.Lista, 
dicionario_marca.Lista, 
dicionario_categoria.Lista, 
dicionario_tema.Lista, 
dicionario_exclusividade.Lista, 
dicionario_segmentacao.Lista, 
dicionario_tipo.Lista, 
sendsfull2.previewurl,
j.Lista, 
j.Cluster

order by 1,2 desc





Consulta Programada: Loreal_Dca_Dmc_Sends_Estruturado
Tabela de inserção: dmc_sfmc_sends_estruturado
horário: 10:30 para atualização


SELECT FT.send_date
      ,FT.emailname
      ,FT.subject
      ,FT.jornadaAgrupada
      ,FT.tipoJornada
      ,FT.rede
      ,FT.marca
      ,FT.categoria
      ,FT.tema
      ,FT.exclusividade
      ,FT.segmentacao
      ,FT.tipo
      ,FT.previewurl
      ,FT.sends
      ,FT.deliveries
      ,FT.uniqueOpens
      ,FT.uniqueClicks
      ,FT.uniqueUnsubscribes
      ,FT.bounces
FROM `enext-datarepository.loreal_dca.view_dmc_sends_estruturado` FT


======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================









VIEW PARA OS SENDS COM AS ESTRUTURAS 

select 
send_date,
emailname as emailname,
sendsfull.journey_name as JourneyName,
CASE WHEN cast(sendsfull.emailname as string) like %xxx% or cast(sendsfull.emailname as string) like %XXX%= Jornadas 
     WHEN cast(sendsfull.emailname as string) like %-reg% or cast(sendsfull.emailname as string) like %-REG% = Jornadas 
     WHEN cast(sendsfull.emailname as string) like %-rea% or cast(sendsfull.emailname as string) like %-REA% = Jornadas 
     WHEN cast(sendsfull.emailname as string) like %-reb% or cast(sendsfull.emailname as string) like %-REB% = Jornadas 
     WHEN cast(sendsfull.emailname as string) like %-req% or cast(sendsfull.emailname as string) like %-REQ% = Jornadas 
     WHEN cast(sendsfull.emailname as string) like %-brd% or cast(sendsfull.emailname as string) like %-BRD% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-broad% or cast(sendsfull.emailname as string) like %-BROAD% = Broadcast
     WHEN cast(sendsfull.emailname as string) like %-borad% or cast(sendsfull.emailname as string) like %-BORAD% = Broadcast
     WHEN cast(sendsfull.emailname as string) like %-bra% or cast(sendsfull.emailname as string) like %-BRA% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-brb% or cast(sendsfull.emailname as string) like %-BRB% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-rep% or cast(sendsfull.emailname as string) like %-REP% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-seg% or cast(sendsfull.emailname as string) like %-SEG% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-sea% or cast(sendsfull.emailname as string) like %-SEA% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-seb% or cast(sendsfull.emailname as string) like %-SEB% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-ctr% or cast(sendsfull.emailname as string) like %-CTR% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-tmp% or cast(sendsfull.emailname as string) like %-TMP% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-dng% or cast(sendsfull.emailname as string) like %-DNG% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-ert% or cast(sendsfull.emailname as string) like %-ERT% = Broadcast 
     ELSE Não Parametrizado END as AntigaParametrizacao,
dicionario_rede.Lista as rede,
dicionario_marca.Lista as marca,
dicionario_categoria.Lista as categoria,
dicionario_tema.Lista as tema,
dicionario_exclusividade.Lista as exclusividade,
dicionario_segmentacao.Lista as segmentacao,
dicionario_tipo.Lista as tipo,
previewurl,
sends,
deliveries,
uniqueOpens,
uniqueClicks,
uniqueSubscribes,
bounces,
FORMAT(%.2f%%, IF(sends > 0, deliveries/sends, 0)*100) as _dr,
FORMAT(%.2f%%, IF(uniqueClicks > 0 and uniqueOpens > 0, uniqueClicks/uniqueOpens, 0) *100) as _ctor,
FORMAT(%.2f%%, IF(uniqueClicks > 0 and deliveries > 0, uniqueClicks/deliveries, 0)*100) as _ctr,
FORMAT(%.2f%%, IF(uniqueOpens > 0 and deliveries > 0, uniqueOpens/deliveries, 0)*100) as _or


from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as sendsfull
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_rede
on lower(sendsfull.rede) = dicionario_rede.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_marca
on lower(sendsfull.marca) = dicionario_marca.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_categoria
on lower(sendsfull.categoria) = dicionario_categoria.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tema
on lower(sendsfull.tema) = dicionario_tema.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_exclusividade
on lower(sendsfull.exclusividade) = dicionario_exclusividade.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_segmentacao
on lower(sendsfull.segmentacao) = dicionario_segmentacao.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tipo
on lower(sendsfull.tipo) = dicionario_tipo.Codigo

where sendsfull.send_date is not NULL 
and sendsfull.send_date >= 2022-01-01

order by 1,2 desc

======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================


#CONSULTA SIMPLES PARA SOMAR VALORES DOS ULTIMOS 90D

SELECT #emailname, 
DISTINCT COUNT(emailname) as TotalEmail,
--FORMAT("%.0f" ,SUM(CAST(sends as FLOAT64))) as sends, 
--FORMAT("%.0f" ,SUM(CAST(deliveries as FLOAT64)))  as deliveries
FROM `enext-datarepository.loreal_dca.dmc_sfmc_sends_full`
WHERE send_date >= 2023-01-30 AND send_date <= 2023-04-30

#group by emailname


======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
#QUERY PARA TRAZER OS RESULTADOS CLUSTERIZADOS + PREVIEWURL SOMENTE 1X

sselect 
sendsfull.send_date,
sendsfull.emailname as emailname,
sendsfull.subject,

/*sendsfull.journey_name as JourneyName,
CASE WHEN cast(sendsfull.emailname as string) like %xxx% or cast(sendsfull.emailname as string) like %XXX%= Jornadas 
     WHEN cast(sendsfull.emailname as string) like %-reg% or cast(sendsfull.emailname as string) like %-REG% = Jornadas 
     WHEN cast(sendsfull.emailname as string) like %-rea% or cast(sendsfull.emailname as string) like %-REA% = Jornadas 
     WHEN cast(sendsfull.emailname as string) like %-reb% or cast(sendsfull.emailname as string) like %-REB% = Jornadas 
     WHEN cast(sendsfull.emailname as string) like %-brd% or cast(sendsfull.emailname as string) like %-BRD% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-broad% or cast(sendsfull.emailname as string) like %-BROAD% = Broadcast
     WHEN cast(sendsfull.emailname as string) like %-borad% or cast(sendsfull.emailname as string) like %-BORAD% = Broadcast
     WHEN cast(sendsfull.emailname as string) like %-bra% or cast(sendsfull.emailname as string) like %-BRA% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-brb% or cast(sendsfull.emailname as string) like %-BRB% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-rep% or cast(sendsfull.emailname as string) like %-REP% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-seg% or cast(sendsfull.emailname as string) like %-SEG% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-sea% or cast(sendsfull.emailname as string) like %-SEA% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-seb% or cast(sendsfull.emailname as string) like %-SEB% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-ctr% or cast(sendsfull.emailname as string) like %-CTR% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-tmp% or cast(sendsfull.emailname as string) like %-TMP% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-dng% or cast(sendsfull.emailname as string) like %-DNG% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-ert% or cast(sendsfull.emailname as string) like %-ERT% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-dos% or cast(sendsfull.emailname as string) like %-DOS% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-cas% or cast(sendsfull.emailname as string) like %-CAS% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-sms% or cast(sendsfull.emailname as string) like %-SMS% = Sms 
     ELSE Não Parametrizado END as AntigaParametrizacao,
CASE WHEN cast(sendsfull.emailname as string) like %xxx% or cast(sendsfull.emailname as string) like %XXX%= Jornada 
     WHEN cast(sendsfull.emailname as string) like %-reg% or cast(sendsfull.emailname as string) like %-REG% = Jornada 
     WHEN cast(sendsfull.emailname as string) like %-rea% or cast(sendsfull.emailname as string) like %-REA% = Jornada 
     WHEN cast(sendsfull.emailname as string) like %-reb% or cast(sendsfull.emailname as string) like %-REB% = Jornada 
     WHEN cast(sendsfull.emailname as string) like %-brd% or cast(sendsfull.emailname as string) like %-BRD% = Broadcast 
     WHEN cast(sendsfull.emailname as string) like %-broad% or cast(sendsfull.emailname as string) like %-BROAD% = Broadcast
     WHEN cast(sendsfull.emailname as string) like %-borad% or cast(sendsfull.emailname as string) like %-BORAD% = Broadcast
     WHEN cast(sendsfull.emailname as string) like %-bra% or cast(sendsfull.emailname as string) like %-BRA% = Broadcast Teste A 
     WHEN cast(sendsfull.emailname as string) like %-brb% or cast(sendsfull.emailname as string) like %-BRB% = Broadcast Teste B 
     WHEN cast(sendsfull.emailname as string) like %-rep% or cast(sendsfull.emailname as string) like %-REP% = Repique 
     WHEN cast(sendsfull.emailname as string) like %-seg% or cast(sendsfull.emailname as string) like %-SEG% = Segmentado 
     WHEN cast(sendsfull.emailname as string) like %-sea% or cast(sendsfull.emailname as string) like %-SEA% = Segmentado Teste A 
     WHEN cast(sendsfull.emailname as string) like %-seb% or cast(sendsfull.emailname as string) like %-SEB% = Segmentado Teste B 
     WHEN cast(sendsfull.emailname as string) like %-ctr% or cast(sendsfull.emailname as string) like %-CTR% = Grupo de Controle 
     WHEN cast(sendsfull.emailname as string) like %-tmp% or cast(sendsfull.emailname as string) like %-TMP% = Template 
     WHEN cast(sendsfull.emailname as string) like %-dng% or cast(sendsfull.emailname as string) like %-DNG% = Desengajado 
     WHEN cast(sendsfull.emailname as string) like %-ert% or cast(sendsfull.emailname as string) like %-ERT% = Errata 
     WHEN cast(sendsfull.emailname as string) like %-dos% or cast(sendsfull.emailname as string) like %-DOS% = Doments 
     WHEN cast(sendsfull.emailname as string) like %-cas% or cast(sendsfull.emailname as string) like %-CAS% = Casuals 
     WHEN cast(sendsfull.emailname as string) like %-sms% or cast(sendsfull.emailname as string) like %-SMS% = Sms 
     ELSE Não Parametrizado END as dType,*/
     j.Lista as jornadaAgrupada, 
     j.Cluster as tipoJornada, 

dicionario_rede.Lista as rede,
dicionario_marca.Lista as marca,
dicionario_categoria.Lista as categoria,
dicionario_tema.Lista as tema,
dicionario_exclusividade.Lista as exclusividade,
dicionario_segmentacao.Lista as segmentacao,
dicionario_tipo.Lista as tipo,
sendsfull2.previewurl,
SUM(sends) as sends,
SUM(deliveries) as deliveries,
SUM(uniqueOpens) as uniqueOpens,
SUM(uniqueClicks) as uniqueClicks,
SUM(uniqueUnsubscribes) as uniqueUnsubscribes,
SUM(bounces) as bounces 


from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as sendsfull
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_rede
on lower(sendsfull.rede) = dicionario_rede.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_marca
on lower(sendsfull.marca) = dicionario_marca.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_categoria
on lower(sendsfull.categoria) = dicionario_categoria.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tema
on lower(sendsfull.tema) = dicionario_tema.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_exclusividade
on lower(sendsfull.exclusividade) = dicionario_exclusividade.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_segmentacao
on lower(sendsfull.segmentacao) = dicionario_segmentacao.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tipo
on lower(sendsfull.tipo) = dicionario_tipo.Codigo
LEFT JOIN (
  SELECT
    teste.send_date,
    teste.emailname,
    MAX(teste.previewurl) as previewurl 
  FROM
   `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` teste
  GROUP BY
    teste.send_date,
    teste.emailname
) AS sendsfull2 ON sendsfull.send_date = sendsfull2.send_date AND sendsfull.emailname = sendsfull2.emailname

left join `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
on lower(TRIM(sendsfull.emailname)) = lower(TRIM(j.Codigo))



where sendsfull.send_date is not NULL 
and sendsfull.send_date >= 2022-01-01
and sendsfull.deliveries > 1

group by 
send_date,
emailname,
sendsfull.subject,
sendsfull.journey_name,
dicionario_rede.Lista, 
dicionario_marca.Lista, 
dicionario_categoria.Lista, 
dicionario_tema.Lista, 
dicionario_exclusividade.Lista, 
dicionario_segmentacao.Lista, 
dicionario_tipo.Lista, 
sendsfull2.previewurl,
j.Lista, 
j.Cluster

order by 1,2 desc






======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================

Consulta Programada: Loreal_Dca_Dmc_Campaign_estruturado
tabela de inserção: dmc_ga_campaign_estruturado
horário de atualização: 10:30


select 
 g.ga_date,
  g.ga_campaign,
  g.ga_sourcemedium,
  g.ga_channelgrouping,
  j.Lista as jornadaAgrupada, 
  j.Cluster as tipoJornada,
  dicionario_rede.Lista as rede,
  dicionario_marca.Lista as marca,
  dicionario_categoria.Lista as categoria,
  dicionario_tema.Lista as tema,
  dicionario_exclusividade.Lista as exclusividade,
  dicionario_segmentacao.Lista as segmentacao,
  dicionario_tipo.Lista as tipo,
  SUM(g.ga_sessions) as ga_sessions,
  SUM(g.ga_transactions) as ga_transactions,
  SUM(g.ga_transactionrevenue) as ga_transactionrevenue,
  SUM(g.ga_itemquantity) as ga_itemquantity
  
from `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as g
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
on lower(trim(g.ga_campaign)) = lower(trim(j.Codigo))
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_rede
on lower(g.rede) = dicionario_rede.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_marca
on lower(g.marca) = dicionario_marca.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_categoria
on lower(g.categoria) = dicionario_categoria.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tema
on lower(g.tema) = dicionario_tema.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_exclusividade
on lower(g.exclusividade) = dicionario_exclusividade.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_segmentacao
on lower(g.segmentacao) = dicionario_segmentacao.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tipo
on lower(g.tipo) = dicionario_tipo.Codigo

group by
g.ga_date,
  g.ga_campaign,
  g.ga_sourcemedium,
  g.ga_channelgrouping,
  j.Lista, 
  j.Cluster,
  dicionario_rede.Lista,
  dicionario_marca.Lista,
  dicionario_categoria.Lista,
  dicionario_tema.Lista,
  dicionario_exclusividade.Lista,
  dicionario_segmentacao.Lista,
  dicionario_tipo.Lista

order by 1,2 desc
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================









Consulta Programada: Loreal_Dca_Dmc_Campaign_estruturado_SemData
tabela de inserção: dmc_ga_campaign_estruturado_semData
horário de atualização: 10:30


select 
  g.ga_campaign,
  g.ga_sourcemedium,
  g.ga_channelgrouping,
  j.Lista as jornadaAgrupada, 
  j.Cluster as tipoJornada,
  dicionario_rede.Lista as rede,
  dicionario_marca.Lista as marca,
  dicionario_categoria.Lista as categoria,
  dicionario_tema.Lista as tema,
  dicionario_exclusividade.Lista as exclusividade,
  dicionario_segmentacao.Lista as segmentacao,
  dicionario_tipo.Lista as tipo,
  SUM(g.ga_sessions) as sessions,
  SUM(g.ga_transactions) as transactions,
  SUM(g.ga_transactionrevenue) as revenue
  
from `enext-datarepository.loreal_dca.dmc_ga_campaign_full_semData` as g
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
on lower(trim(g.ga_campaign)) = lower(trim(j.Codigo))
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_rede
on lower(g.rede) = dicionario_rede.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_marca
on lower(g.marca) = dicionario_marca.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_categoria
on lower(g.categoria) = dicionario_categoria.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tema
on lower(g.tema) = dicionario_tema.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_exclusividade
on lower(g.exclusividade) = dicionario_exclusividade.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_segmentacao
on lower(g.segmentacao) = dicionario_segmentacao.Codigo
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario` as dicionario_tipo
on lower(g.tipo) = dicionario_tipo.Codigo

group by
  g.ga_campaign,
  g.ga_sourcemedium,
  g.ga_channelgrouping,
  j.Lista, 
  j.Cluster,
  dicionario_rede.Lista,
  dicionario_marca.Lista,
  dicionario_categoria.Lista,
  dicionario_tema.Lista,
  dicionario_exclusividade.Lista,
  dicionario_segmentacao.Lista,
  dicionario_tipo.Lista

order by 1,2 desc
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================





select j.Lista,
       j.Codigo,
       s.emailname,
       s.journey_name,
       
       SUM(s.sends) as sends, 
       SUM(s.uniqueOpens) as opens,
       SUM(s.uniqueClicks) as clicks,
       SUM(s.deliveries) as deliveries,
       SUM(s.uniqueUnsubscribes) as unsubscribes

from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as s 
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
on lower(TRIM(s.emailname)) = lower(TRIM(j.Codigo))
where s.send_date BETWEEN 2023-05-01 and 2023-05-24
and j.Lista is not null

group by j.Lista,
       j.Codigo,
       s.emailname,s.journey_name
    



======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================



select 
#g.ga_date,
#g.ga_campaign,
j.Lista,
SUM(g.ga_sessions) as sessions,
SUM(g.ga_transactions) as transactions,
ROUND(SUM(g.ga_transactionrevenue),2) as revenue

from `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j 
left join`enext-datarepository.loreal_dca.dmc_ga_campaign_full` as g
on lower(trim(g.ga_campaign)) = lower(trim(j.Codigo))
    

where j.Lista is not null
and g.ga_date is not null
and g.ga_date between 2023-05-01 and 2023-05-21

group by 
#g.ga_date,
#g.ga_campaign,
j.Lista

======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================

select 
     j.Codigo as jornada,
     j.Lista as jornadaAgrupada, 
     j.Cluster as tipoJornada, 
     s.send_date,
     SUM(s.sends) as sends, 
     SUM(s.uniqueOpens) as opens,
     SUM(s.uniqueClicks) as clicks,
     SUM(s.deliveries) as deliveries,
     SUM(s.uniqueUnsubscribes) as unsubscribes

from `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
left join `enext-datarepository.loreal_dca.view_dmc_sends_estruturado` as s
on lower(TRIM(s.emailname)) = lower(TRIM(j.Codigo))

where j.Lista is not null
and s.send_date is not null

group by 
j.Codigo,
j.Lista, 
j.Cluster,
s.send_date



 Tela de share como Guia.
 Somando os valores tem que dar o resultado.









======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================

Query para estrutura do GA Full


Consulta programada: Lorea_Dca_Dmc_Campaign_Estruturado
Tabela de inserção: dmc_ga_campaign_estruturado


select 
SUM(g.ga_sessions) as sessions,
SUM(g.ga_transactions) as transactions,
SUM(g.ga_transactionrevenue) as revenue,
g.ga_campaign,
g.ga_sourcemedium,
g.ga_channelgrouping,
j.Lista,
j.Cluster


from `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as g
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
on lower(TRIM(g.ga_campaign)) = lower(TRIM(j.Codigo))

group by
g.ga_campaign,
g.ga_sourcemedium,
g.ga_channelgrouping,
j.Lista,
j.Cluster

======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================
======================================================================================================================================================

Query para estrutura do GA Full sem data

Consulta programada: Lorea_Dca_Dmc_Campaign_Estruturado_SemData 
Tabela de inserção: dmc_ga_campaign_estruturado_semData

select 
SUM(g.ga_sessions) as sessions,
SUM(g.ga_transactions) as transactions,
SUM(g.ga_transactionrevenue) as revenue,
g.ga_campaign,
g.ga_sourcemedium,
g.ga_date,
g.ga_channelgrouping,
j.Lista,
j.Cluster


from `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as g
left join `enext-datarepository.loreal_dca.dmc_dca_dicionario_jornadas` as j
on lower(TRIM(g.ga_campaign)) = lower(TRIM(j.Codigo))

group by
g.ga_campaign,
g.ga_sourcemedium,
g.ga_date,
g.ga_channelgrouping,
j.Lista,
j.Cluster

==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================



select 
sends.emailname as campanhaSF,
sends.send_date as dateSF,
sends.rede as redeSF,
sends.marca as marcaSF,
sends.categoria as categoriaSF,
sends.tema as temaSF,
sends.tipo as tipoSF,
sends.segmentacao as segmentacaoSF,
sends.exclusividade as exclusividadeSF,
sends.subject as subjectSF,
SUM(sends.sends) as sendsSF,
SUM(sends.deliveries) as deliveriesSF,
SUM(sends.uniqueOpens) as opensSF,
SUM(sends.uniqueClicks) as clicksSF,
SUM(ga.revenueGA) as receitaGA,
SUM(ga.transactionsGA) as transacoesGA,
SUM(ga.sessionsGA) as sessoesGA

from `enext-datarepository.loreal_dca.dmc_sfmc_sends_estruturado` as sends
left join (

    select
    g.ga_campaign as campanhaGA,
    g.ga_date as dateGA,
    g.rede as redeGA,
    g.marca as marcaGA,
    g.categoria as categoriaGA,
    g.tema as temaGA,
    g.tipo as tipoGA,
    g.segmentacao as segmentacaoGA,
    g.exclusividade as exclusividadeGA,
    SUM(g.ga_sessions) as sessionsGA,
    SUM(g.ga_transactionrevenue) as revenueGA,
    SUM(g.ga_transactions) as transactionsGA
    from `enext-datarepository.loreal_dca.dmc_ga_campaign_estruturado` as g

    group by 1,2,3,4,5,6,7,8,9
) as ga on lower(trim(sends.emailname)) = lower(trim(ga.campanhaGA)) and sends.send_date = ga.dateGA

where emailname like %ADS1_DMC_BRA_D2C-DC-MM-MC-03-E-007-BRD_1_2023% 
and send_date >= 2023-05-01 
and send_date <= 2023-05-31

group by 1,2,3,4,5,6,7,8,9,10




TESTE 2 da consulta mesclada



select 
distinct sends.emailname as campanhaSF,
sends3.preview,
SUM(sends.sends) as sendsSF,
SUM(sends.deliveries) as deliveriesSF,
SUM(sends.uniqueOpens) as opensSF,
SUM(sends.uniqueClicks) as clicksSF,
SUM(ga.revenueGA) as receitaGA,
SUM(ga.transactionsGA) as transacoesGA,
SUM(ga.sessionsGA) as sessoesGA

from `enext-datarepository.loreal_dca.dmc_sfmc_sends_estruturado` as sends
left join (

    select
    g.ga_campaign as campanhaGA,
    g.ga_date as dateGA,
    g.rede as redeGA,
    g.marca as marcaGA,
    g.categoria as categoriaGA,
    g.tema as temaGA,
    g.tipo as tipoGA,
    g.segmentacao as segmentacaoGA,
    g.exclusividade as exclusividadeGA,
    SUM(g.ga_sessions) as sessionsGA,
    SUM(g.ga_transactionrevenue) as revenueGA,
    SUM(g.ga_transactions) as transactionsGA
    from `enext-datarepository.loreal_dca.dmc_ga_campaign_estruturado` as g

    group by 1,2,3,4,5,6,7,8,9
) as ga on lower(trim(sends.emailname)) = lower(trim(ga.campanhaGA)) and sends.send_date = ga.dateGA

left join (
  select distinct MAX(previewurl) as preview, emailname from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full`
where 
CASE
    WHEN REGEXP_CONTAINS(UPPER(emailname),-REG|XXXXXX|-REA|-REB|-REQ) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-REP-REG) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Abandoned_Cart) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Boleto_Paid) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Boleto_Expired) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Boleto_NoPaid) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Payment_Confirmed_Pix) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Rejected_Payment) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Cancelled) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Order_Status_Brain) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Return) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Shippign_Notification) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Account_Creation) = "Jornada"
    WHEN REGEXP_CONTAINS(emailname,DMC_BRA_Newsletter) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-BROAD|BRD|BROA|BRB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-SEG|-SEA|-SEB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-TEMP|-TMP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-DNG) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-REP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-ERT) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-DOR) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-CAS) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(emailname),-CTR) = "Broadcast"  ELSE "Broadcast" 
END = Jornada

group by 2
) sends3 on lower(TRIM(sends3.emailname)) = lower(trim(sends.emailname))

where

CASE
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-REG|XXXXXX|-REA|-REB|-REQ) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-REP-REG) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Abandoned_Cart) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Boleto_Paid) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Boleto_Expired) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Boleto_NoPaid) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Payment_Confirmed_Pix) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Rejected_Payment) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Cancelled) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Order_Status_Brain) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Return) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Shippign_Notification) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Account_Creation) = "Jornada"
    WHEN REGEXP_CONTAINS(sends.emailname,DMC_BRA_Newsletter) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-BROAD|BRD|BROA|BRB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-SEG|-SEA|-SEB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-TEMP|-TMP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-DNG) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-REP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-ERT) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-DOR) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-CAS) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(sends.emailname),-CTR) = "Broadcast"  ELSE "Broadcast" 
END = Jornada

group by 1,2

order by 3 desc

==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================





CASE
   WHEN REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*step1*.) OR REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*stp1*.) = Step1
   WHEN REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*step2*.) OR REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*stp2*.) = Step2
   WHEN REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*step3*.) OR REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*stp3*.) = Step3
   WHEN REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*step4*.) OR REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*stp4*.) = Step4
   WHEN REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*step5*.) OR REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*stp5*.) = Step5
   WHEN REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*step6*.) OR REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*stp6*.) = Step6
   WHEN REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*step7*.) OR REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*stp7*.) = Step7
   WHEN REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*step8*.) OR REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*stp8*.) = Step8
   WHEN REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*step9*.) OR REGEXP_CONTAINS(LOWER(TRIM(emailname)), .*stp9*.) = Step9
 ELSE "Step1" 
 END




==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================





select sf.send_date,
       sf.emailname,
       sf.subject,
       sf.jornadaAgrupada,
       sf.tipoJornada,
       sf.rede,
       sf.marca,
       sf.categoria,
       sf.tema,
       sf.exclusividade,
       sf.segmentacao,
       sf.tipo,
       sf.previewurl,
       sf.sends,
       sf.deliveries,
       sf.uniqueOpens,
       sf.uniqueClicks,
       sf.uniqueUnsubscribes,
       sf.bounces

from `enext-datarepository.loreal_dca.dmc_sfmc_sends_estruturado` as sf




select
ga.ga_date,
ga.ga_campaign,
ga.jornadaAgrupada,
ga.tipoJornada,
ga.rede,
ga.marca,
ga.categoria,
ga.tema,
ga.exclusividade,
ga.segmentacao,
ga.tipo,
ga.ga_sessions,
ga.ga_transactions,
ga.ga_transactionrevenue,
ga.ga_itemquantity

from `enext-datarepository.loreal_dca.dmc_ga_campaign_estruturado` as ga

where ga.ga_sourcemedium like %crm% or ga.ga_sourcemedium like %email% or ga.ga_sourcemedium like %salesforce%



==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================



 Colocar Glossário
 Mudar KPis diferentes no fechamento (Cluster) OR e CTRO, sem receita.
 Tirar Receita e gráfico de Rosca no cluster




==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================

Loreal_Dca_Skc_Fato_Sends



/*select 
sends.send_date,
TRIM(sends.email_name) as emailname,

  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 2 and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(1)], r[^_]+) ELSE NULL END as categoria,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 3 and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(2)], r[^_]+) ELSE NULL END as tema,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 4 and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(3)], r[^_]+) ELSE NULL END as repCampanha,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 5 and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(4)], r[^_]+) ELSE NULL END as exclusividade,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 6 and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(5)], r[^_]+) ELSE NULL END as segmentacao,  
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(sends.email_name), -)) >= 7 and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(sends.email_name),-)[OFFSET(6)], r[^_]+) ELSE NULL END as tipo,  

kondado.previewurl,
sends.journey_name,
sends.Email_Subject as subject,
SUM(sends.sends) as sends,
SUM(sends.deliveries) as deliveries,
SUM(sends.unique_clicks) as uniqueClicks,
SUM(sends.unique_opens) as uniqueOpens,
SUM(sends.unique_unsubscribes) as uniqueUnsubscribes,
SUM(sends.bounces) as bounces

from `enext-datarepository.loreal_dca.skc_sfmc_sends` as sends
left join `enext-datarepository.loreal_dca.skc_sfmc_sends_kondado` as kondado on cast(kondado.id as INT64) = sends.job_ID

group by 1,2,3,4,5,6,7,8,9,10,11

order by 1 desc*/


select 
sends.send_date,
TRIM(sends.email_name) as emailname,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(emailname, _, -)), -)) >= 4 and emailname like A% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(emailname, _, -)),-)[OFFSET(3)], r[^_]+) ELSE NULL END as marca,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(emailname, _, -)), -)) >= 5 and emailname like A% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(emailname, _, -)),-)[OFFSET(4)], r[^_]+) ELSE NULL END as categoria,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(emailname, _, -)), -)) >= 6 and emailname like A% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(emailname, _, -)),-)[OFFSET(5)], r[^_]+) ELSE NULL END as tema,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(emailname, _, -)), -)) >= 7 and emailname like A% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(emailname, _, -)),-)[OFFSET(6)], r[^_]+) ELSE NULL END as repCampanha,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(emailname, _, -)), -)) >= 8 and emailname like A% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(emailname, _, -)),-)[OFFSET(7)], r[^_]+) ELSE NULL END as exclusividade,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(emailname, _, -)), -)) >= 9 and emailname like A% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(emailname, _, -)),-)[OFFSET(8)], r[^_]+) ELSE NULL END as segmentacao,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(emailname, _, -)), -)) >= 10 and emailname like A% and sends.send_date >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(emailname, _, -)),-)[OFFSET(9)], r[^_]+) ELSE NULL END as tipo,


kondado.previewurl,
sends.journey_name,
sends.Email_Subject as subject,
SUM(sends.sends) as sends,
SUM(sends.deliveries) as deliveries,
SUM(sends.unique_clicks) as uniqueClicks,
SUM(sends.unique_opens) as uniqueOpens,
SUM(sends.unique_unsubscribes) as uniqueUnsubscribes,
SUM(sends.bounces) as bounces

from `enext-datarepository.loreal_dca.skc_sfmc_sends` as sends
left join `enext-datarepository.loreal_dca.skc_sfmc_sends_kondado` as kondado on cast(kondado.id as INT64) = sends.job_ID

group by 1,2,3,4,5,6,7,8,9,10,11,12,13

order by 1 desc





==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================



Loreal_Dca_Skc_Sends_Estruturado


select 
sendsfull.send_date,
sendsfull.emailname as emailname,
sendsfull.subject,
j.Lista as jornadaAgrupada, 
j.Cluster as tipoJornada, 
dicionario_marca.Lista as Marca,
dicionario_categoria.Lista as categoria,
dicionario_tema.Lista as tema,
sendsfull.repCampanha as refCampanha,
dicionario_exclusividade.Lista as exclusividade,
dicionario_segmentacao.Lista as segmentacao,
dicionario_tipo.Lista as tipo,
sendsfull2.previewurl,
SUM(sends) as sends,
SUM(deliveries) as deliveries,
SUM(uniqueOpens) as uniqueOpens,
SUM(uniqueClicks) as uniqueClicks,
SUM(uniqueUnsubscribes) as uniqueUnsubscribes,
SUM(bounces) as bounces 


from `enext-datarepository.loreal_dca.skc_sfmc_sends_full` as sendsfull
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_marca
on lower(sendsfull.marca) = dicionario_marca.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_categoria
on lower(sendsfull.categoria) = dicionario_categoria.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_tema
on lower(sendsfull.tema) = dicionario_tema.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_exclusividade
on lower(sendsfull.exclusividade) = dicionario_exclusividade.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_segmentacao
on lower(sendsfull.segmentacao) = dicionario_segmentacao.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_tipo
on lower(sendsfull.tipo) = dicionario_tipo.Codigo
LEFT JOIN (
  SELECT
    teste.send_date,
    teste.emailname,
    MAX(teste.previewurl) as previewurl 
  FROM
   `enext-datarepository.loreal_dca.skc_sfmc_sends_full` teste
  GROUP BY
    teste.send_date,
    teste.emailname
) AS sendsfull2 ON sendsfull.send_date = sendsfull2.send_date AND sendsfull.emailname = sendsfull2.emailname

left join `enext-datarepository.loreal_dca.skc_dicionario_jornadas` as j
on lower(TRIM(sendsfull.emailname)) = lower(TRIM(j.Codigo))


where sendsfull.send_date is not NULL 
and sendsfull.send_date >= 2022-01-01

group by 
1,2,3,4,5,6,7,8,9,10,11,12,13

order by 1,2 desc



==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================

Loreal_Dca_Skc_Fato_Campaign e Loreal_Dca_Skc_Fato_Campaign_SemData

tabela: skc_ga_campaign_full e skc_ga_campaign_full_semData

   select
    SUM(ga.ga_sessions) as ga_sessions,
    SUM(ga.ga_transactions) as ga_transactions,
    SUM(ga.ga_transactionrevenue) as ga_transactionrevenue,
    SUM(ga.ga_itemquantity) as ga_itemquantity,
    TRIM(ga.ga_campaign) as ga_campaign,
    ga.ga_sourcemedium as ga_sourcemedium,
    CAST(PARSE_DATE("%Y%m%d", ga.ga_date) as DATE) as ga_date,
    ga.ga_channelgrouping as ga_channelgrouping,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)), -)) >= 4 and ga.ga_campaign like A% and CAST(PARSE_DATE("%Y%m%d", ga.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)),-)[OFFSET(3)], r[^_]+) ELSE NULL END as marca,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)), -)) >= 5 and ga.ga_campaign like A% and CAST(PARSE_DATE("%Y%m%d", ga.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)),-)[OFFSET(4)], r[^_]+) ELSE NULL END as categoria,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)), -)) >= 6 and ga.ga_campaign like A% and CAST(PARSE_DATE("%Y%m%d", ga.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)),-)[OFFSET(5)], r[^_]+) ELSE NULL END as tema,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)), -)) >= 7 and ga.ga_campaign like A% and CAST(PARSE_DATE("%Y%m%d", ga.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)),-)[OFFSET(6)], r[^_]+) ELSE NULL END as repCampanha,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)), -)) >= 8 and ga.ga_campaign like A% and CAST(PARSE_DATE("%Y%m%d", ga.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)),-)[OFFSET(7)], r[^_]+) ELSE NULL END as exclusividade,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)), -)) >= 9 and ga.ga_campaign like A% and CAST(PARSE_DATE("%Y%m%d", ga.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)),-)[OFFSET(8)], r[^_]+) ELSE NULL END as segmentacao,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)), -)) >= 10 and ga.ga_campaign like A% and CAST(PARSE_DATE("%Y%m%d", ga.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(ga.ga_campaign, _, -)),-)[OFFSET(9)], r[^_]+) ELSE NULL END as tipo

from
    `enext-datarepository.loreal_dca.skc_ga_campaigns` as ga


group by 5,6,7,8,9,10,11,12,13,14,15


==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================

Loreal_Dca_Skc_Campaign_Estruturado e Loreal_Dca_Skc_Campaign_Estruturado_SemData
Tabela: skc_ga_campaign_estruturado e skc_ga_campaign_estruturado_semData

select 
  g.ga_date,
  g.ga_campaign,
  g.ga_sourcemedium,
  g.ga_channelgrouping,
  j.Lista as jornadaAgrupada, 
  j.Cluster as tipoJornada,
  dicionario_marca.Lista as marca,
  dicionario_categoria.Lista as categoria,
  dicionario_tema.Lista as tema,
  dicionario_exclusividade.Lista as exclusividade,
  dicionario_segmentacao.Lista as segmentacao,
  dicionario_tipo.Lista as tipo,
  SUM(g.ga_sessions) as ga_sessions,
  SUM(g.ga_transactions) as ga_transactions,
  SUM(g.ga_transactionrevenue) as ga_transactionrevenue,
  SUM(g.ga_itemquantity) as ga_itemquantity
  
from `enext-datarepository.loreal_dca.skc_ga_campaign_full` as g
left join `enext-datarepository.loreal_dca.skc_dicionario_jornadas` as j
on lower(trim(g.ga_campaign)) = lower(trim(j.Codigo))
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_marca
on lower(g.marca) = dicionario_marca.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_categoria
on lower(g.categoria) = dicionario_categoria.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_tema
on lower(g.tema) = dicionario_tema.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_exclusividade
on lower(g.exclusividade) = dicionario_exclusividade.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_segmentacao
on lower(g.segmentacao) = dicionario_segmentacao.Codigo
left join `enext-datarepository.loreal_dca.skc_dicionario` as dicionario_tipo
on lower(g.tipo) = dicionario_tipo.Codigo

group by 1,2,3,4,5,6,7,8,9,10,11,12

order by 1,2 desc




https://ideas.salesforce.com/s/search#t=All&sort=relevancy





==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================


dmc_dimensão

select 
TRIM(s.emailname) as dCampanha,
s.send_date as dDate,
MAX(s.subject) as subject,
MAX(cast(null as string)) as sourcemedium,
MAX(cast(null as string)) as channelgrouping,
s.jornadaAgrupada,
s.tipoJornada,
s.rede,
s.marca,
s.categoria,
s.tema,
s.exclusividade,
s.segmentacao,
s.tipo,
MAX(url.p_url) as previewurl,
SUM(s.sends) as envios,
SUM(s.deliveries) as entregues,
SUM(s.uniqueOpens) as opens,
SUM(s.uniqueClicks) as clicks,
SUM(s.uniqueUnsubscribes) as unsubscribes,
SUM(s.bounces) as bounces,
0 as sessions,
0 as transactions,
0 as revenue,
0 as itemquantity

from `enext-datarepository.loreal_dca.dmc_sfmc_sends_estruturado` as s
left join (
  select MAX(ss.previewurl) as p_Url,
         ss.emailname
  from `enext-datarepository.loreal_dca.dmc_sfmc_sends_estruturado` as ss
  group by 2
) as url on lower(trim(url.emailname)) = lower(trim(s.emailname))

where s.send_date between 2023-07-01 and 2023-07-10
and s.emailname like AEG9%

group by 1,2,6,7,8,9,10,11,12,13,14


union all

select 
TRIM(g.ga_campaign) as dCampanha,
g.ga_date as dDate,
MAX(cast(null as string)) as subject,
MAX(g.ga_sourcemedium) as sourcemedium,
MAX(g.ga_channelgrouping) as channelgrouping,
g.jornadaAgrupada,
g.tipoJornada,
g.rede,
g.marca,
g.categoria,
g.tema,
g.exclusividade,
g.segmentacao,
g.tipo,
MAX(url.p_url)as previewurl,
0 as envios,
0 as entregues,
0 as opens,
0 as clicks,
0 as unsubscribes,
0 as bounces,
SUM(g.ga_sessions) as sessions,
SUM(g.ga_transactions) as transactions,
SUM(g.ga_transactionrevenue) as revenue,
SUM(g.ga_itemquantity) as itemquantitiy

from `enext-datarepository.loreal_dca.dmc_ga_campaign_estruturado` as g
left join (
  select MAX(ss.previewurl) as p_url,
         ss.emailname
  from `enext-datarepository.loreal_dca.dmc_sfmc_sends_estruturado` as ss
  group by 2
) as url on lower(trim(url.emailname)) = lower(trim(g.ga_campaign))


where g.ga_date between 2023-07-01 and 2023-07-10
and g.ga_campaign like AEG9%

group by 1,2,6,7,8,9,10,11,12,13,14

order by 1,2 desc




==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================

select dCampanha, previewurl, SUM(envios), dDate from `enext-datarepository.loreal_dca.dmc_dimensao`
where dDate between 2023-07-01 and 2023-07-10
and dCampanha like AEG9%
group by 1,2,4


==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================
==========================================================================================================================================


select emailname, SUM(sends) as envio from `enext-datarepository.loreal_dca.dmc_sfmc_sends_estruturado`
where send_date between 2023-07-01 and 2023-07-10
#and emailname like %retained-customers-anti-churn-step1-reg%
and TRIM(emailname) like %anti-churn-step1%
group by 1













Tipo de Canal

CASE

    WHEN REGEXP_CONTAINS(LOWER(ga_sourcemedium),whatsapp|wpp) = "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(ga_campaign),whatsapp|wpp) = "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(ga_sourcemedium),sms) = "SMS"
    WHEN REGEXP_CONTAINS(LOWER(ga_sourcemedium),crm|salesforce|email|) = "E-mail"

ELSE "Outros"

END



Tipo de Email

CASE
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-REG|XXXXXX|-REA|-REB|-REQ) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-REP-REG) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Abandoned_Cart) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Boleto_Paid) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Boleto_Expired) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Boleto_NoPaid) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Payment_Confirmed_Pix) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Rejected_Payment) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Cancelled) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Order_Status_Brain) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Return) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Shipping_Notification) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Account_Creation) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Newsletter) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-BROAD|BRD|BROA|BRB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-SEG|-SEA|-SEB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-TEMP|-TMP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-DNG) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-REP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-ERT) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-DOR) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-CAS) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-CTR) = "Broadcast"
    

        ELSE "Broadcast"

END





Tipo de Envio



CASE
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-REG|XXXXXX|-REA|-REB|-REQ) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-REP-REG) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Abandoned_Cart) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Boleto_Paid) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Boleto_Expired) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Boleto_NoPaid) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Payment_Confirmed_Pix) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Rejected_Payment) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Cancelled) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Order_Status_Brain) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Return) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Shipping_Notification) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Account_Creation) = "Jornada"
    WHEN REGEXP_CONTAINS(ga_campaign,DMC_BRA_Newsletter) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-BROAD|-BRD|-BRA|-BRB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-SEG|-SEA|SEB) = "Segmentado"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-TEMP|-TMP) = "Template"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-DNG) = "Desengajado"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-REP) = "Repique"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-ERT) = "Errata"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-DOR) = "Doments"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-CAS) = "Casuals"
    WHEN REGEXP_CONTAINS(UPPER(ga_campaign),-CTR) = "Grupo de Controle"

        ELSE "Broadcast"

END




Semana

WEEK(ga_date)


Mês

MONTH(ga_date)



Mês-Ano(data)
PARSE_DATE(%m-%Y, Mês-Ano (Texto))



Mês-Ano (Texto)
CONCAT(MONTH(ga_date), "-", YEAR(ga_date))


















select dCampanha, 
previewurl,
SUM(envios) as  envios,
SUM(entregues) as entregues,
SUM(opens) as opens,
SUM(unsubscribes) as unsubs,
SUM(sessions) as sessions,
SUM(transactions) as transactions,
SUM(revenue) as revenue
from `enext-datarepository.loreal_dca.dmc_sfmc_ga_fato`
where dDate >= 2023-07-01 and dDate <= 2023-07-12
and CASE
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-REG|XXXXXX|-REA|-REB|-REQ) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-REP-REG) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Abandoned_Cart) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Boleto_Paid) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Boleto_Expired) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Boleto_NoPaid) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Payment_Confirmed_Pix) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Rejected_Payment) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Cancelled) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Order_Status_Brain) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Return) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Shippign_Notification) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Account_Creation) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Newsletter) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-BROAD|BRD|BROA|BRB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-SEG|-SEA|-SEB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-TEMP|-TMP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-DNG) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-REP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-ERT) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-DOR) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-CAS) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-CTR) = "Broadcast"
    

        ELSE "Broadcast"

END = Jornada
group by 1,2










=============================================================================================


case when sendsfull.emailname = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when sendsfull.emailname = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when sendsfull.emailname = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when sendsfull.emailname = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when sendsfull.emailname = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg  = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-semstep-reg
     when sendsfull.emailname = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when sendsfull.emailname = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when sendsfull.emailname = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when sendsfull.emailname = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when sendsfull.emailname = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when sendsfull.emailname = der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-step1-reg  = der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-semstep-reg
     when sendsfull.emailname = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-reg  = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-stepzicard-reg
     when sendsfull.emailname = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step1-reg
     when sendsfull.emailname = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step5-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg
     when sendsfull.emailname = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step6-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step2-reg
     when sendsfull.emailname = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg
     when sendsfull.emailname = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-reg  = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-stepzicard-reg
     when sendsfull.emailname = der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-reg  = der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-step1-reg
     when sendsfull.emailname = AAL5_DMC_BRA_abandonecart-stp3-reg_2_2022  = AAL5_DMC_BRA_abandonecart-step2-reg_2_2022
     when sendsfull.emailname = der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-reg  = der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-stepzicard-reg
     when sendsfull.emailname = der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-reg  = der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-semstep-reg
     when sendsfull.emailname = der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-reg  = der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-step1-reg
     when sendsfull.emailname = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-rep-reg  = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step2-reg
     when sendsfull.emailname = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-reg  = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step1-reg
     when sendsfull.emailname = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-reg  = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step1-reg
     when sendsfull.emailname = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-rep-reg  = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step2-reg
     when sendsfull.emailname = der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-reg  = der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-stepzicard-reg
     when sendsfull.emailname = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg  = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg
     when sendsfull.emailname = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg  = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg
     when sendsfull.emailname = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-reg  = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-stepzicard-reg
     when sendsfull.emailname = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-rep-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg
     when sendsfull.emailname = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-rep-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg
     when sendsfull.emailname = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-reg
     when sendsfull.emailname = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-reg = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-stepzicard-reg
     when sendsfull.emailname = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-reg = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-stepzicard-reg
     when sendsfull.emailname = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-reg = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-stepzicard-reg
     when sendsfull.emailname = der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-reg = der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-step1-reg
     when sendsfull.emailname = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-reg = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step1-reg
     when sendsfull.emailname = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-rep-reg = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step2-reg
     when sendsfull.emailname = der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-reg = der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-step1-reg
     when sendsfull.emailname = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-reg = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-stepzicard-reg
     when sendsfull.emailname = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-reg = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-stepzicard-reg
     when sendsfull.emailname = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-reg = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-stepzicard-reg
     when sendsfull.emailname = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-reg = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-stepzicard-reg
     when sendsfull.emailname = DMC_BRA_Rejected_Payment = DMC_BRA_Rejected_Payment-step1
     when sendsfull.emailname = DMC_BRA_Order_Status_Brain = DMC_BRA_Order_Status_Brain-step1
     when sendsfull.emailname = DMC_BRA_Return = DMC_BRA_Return-step1
     when sendsfull.emailname = DMC_BRA_Cancelled = DMC_BRA_Cancelled-step1
     when sendsfull.emailname = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-reg = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-stepzicard-reg
     when sendsfull.emailname = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-reg = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-stepzicard-reg
     when sendsfull.emailname = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-02-reg = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step1-reg
     when sendsfull.emailname = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-03-reg = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step2-reg
     when sendsfull.emailname = der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-reg = der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-step1-reg
     when sendsfull.emailname = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-rep-reg = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step4-reg
     when sendsfull.emailname = AAO9_DMC_BRA_recompra-stp-refil-reg_1_2022 = AAO9_DMC_BRA_recompra-stp-refil-step3-reg_1_2022
     when sendsfull.emailname = AAP1_DMC_BRA_recompra-stp-minis-reg_1_2022 = AAP1_DMC_BRA_recompra-stp-minis-step3-reg_1_2022
     when sendsfull.emailname = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-reg = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-stepzicard-reg
     when sendsfull.emailname = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa-stepzicard
     when sendsfull.emailname = der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-reg = der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-step1-reg
     when sendsfull.emailname = DMC_BRA_Shipping_Notification = DMC_BRA_Shipping_Notification-step1
     when sendsfull.emailname = ACR2_DMC_BRA_ultracover-stp4m2200-reg_1_2023 = ACR2_DMC_BRA_ultracover-stp4m2200-semstep-reg_1_2023
     when sendsfull.emailname = ACR2_DMC_BRA_ultracover-stp4-2200-reg_1_2023 = ACR2_DMC_BRA_ultracover-stp4-2200-step4-reg_1_2023
     when sendsfull.emailname = ACR3_DMC_BRA_ultracover-stp4-2200-reg_1_2023 = ACR3_DMC_BRA_ultracover-stp4-2200-semstep-reg_1_2023
     when sendsfull.emailname = AAD1_LRP_BRA_ultracover-stp4m2200-reg_1_2023 = AAD1_LRP_BRA_ultracover-stp4m2200-step4-reg_1_2023
     when sendsfull.emailname = DMC_BRA_Boleto_NoPaid = DMC_BRA_Boleto_NoPaid-step1
     when sendsfull.emailname = DMC_BRA_Boleto_Expired = DMC_BRA_Boleto_Expired-step1
     when sendsfull.emailname = DMC_BRA_Boleto_Paid = DMC_BRA_Boleto_Paid-step1
     when sendsfull.emailname = DMC_BRA_Abandoned_Cart = DMC_BRA_Abandoned_Cart-step1
     when sendsfull.emailname = DMC_BRA_Account_Creation = DMC_BRA_Account_Creation-step1
     when sendsfull.emailname = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-reg = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-stepzicard-reg
     when sendsfull.emailname = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-reg = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-stepzicard-reg
     else sendsfull.emailname
end as emailname,


















case when g.ga_campaign = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when g.ga_campaign = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when g.ga_campaign = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when g.ga_campaign = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when g.ga_campaign = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg  = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-semstep-reg
     when g.ga_campaign = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when g.ga_campaign = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when g.ga_campaign = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when g.ga_campaign = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when g.ga_campaign = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when g.ga_campaign = der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-step1-reg  = der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-semstep-reg
     when g.ga_campaign = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-reg  = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-stepzicard-reg
     when g.ga_campaign = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step1-reg
     when g.ga_campaign = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step5-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg
     when g.ga_campaign = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step6-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step2-reg
     when g.ga_campaign = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg
     when g.ga_campaign = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-reg  = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-stepzicard-reg
     when g.ga_campaign = der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-reg  = der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-step1-reg
     when g.ga_campaign = AAL5_DMC_BRA_abandonecart-stp3-reg_2_2022  = AAL5_DMC_BRA_abandonecart-step2-reg_2_2022
     when g.ga_campaign = der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-reg  = der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-stepzicard-reg
     when g.ga_campaign = der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-reg  = der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-semstep-reg
     when g.ga_campaign = der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-reg  = der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-step1-reg
     when g.ga_campaign = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-rep-reg  = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step2-reg
     when g.ga_campaign = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-reg  = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step1-reg
     when g.ga_campaign = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-reg  = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step1-reg
     when g.ga_campaign = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-rep-reg  = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step2-reg
     when g.ga_campaign = der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-reg  = der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-stepzicard-reg
     when g.ga_campaign = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg  = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg
     when g.ga_campaign = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg  = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg
     when g.ga_campaign = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-reg  = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-stepzicard-reg
     when g.ga_campaign = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-rep-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg
     when g.ga_campaign = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-rep-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg
     when g.ga_campaign = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-reg
     when g.ga_campaign = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-reg = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-stepzicard-reg
     when g.ga_campaign = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-reg = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-stepzicard-reg
     when g.ga_campaign = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-reg = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-stepzicard-reg
     when g.ga_campaign = der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-reg = der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-step1-reg
     when g.ga_campaign = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-reg = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step1-reg
     when g.ga_campaign = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-rep-reg = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step2-reg
     when g.ga_campaign = der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-reg = der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-step1-reg
     when g.ga_campaign = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-reg = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-stepzicard-reg
     when g.ga_campaign = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-reg = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-stepzicard-reg
     when g.ga_campaign = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-reg = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-stepzicard-reg
     when g.ga_campaign = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-reg = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-stepzicard-reg
     when g.ga_campaign = DMC_BRA_Rejected_Payment = DMC_BRA_Rejected_Payment-step1
     when g.ga_campaign = DMC_BRA_Order_Status_Brain = DMC_BRA_Order_Status_Brain-step1
     when g.ga_campaign = DMC_BRA_Return = DMC_BRA_Return-step1
     when g.ga_campaign = DMC_BRA_Cancelled = DMC_BRA_Cancelled-step1
     when g.ga_campaign = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-reg = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-stepzicard-reg
     when g.ga_campaign = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-reg = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-stepzicard-reg
     when g.ga_campaign = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-02-reg = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step1-reg
     when g.ga_campaign = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-03-reg = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step2-reg
     when g.ga_campaign = der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-reg = der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-step1-reg
     when g.ga_campaign = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-rep-reg = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step4-reg
     when g.ga_campaign = AAO9_DMC_BRA_recompra-stp-refil-reg_1_2022 = AAO9_DMC_BRA_recompra-stp-refil-step3-reg_1_2022
     when g.ga_campaign = AAP1_DMC_BRA_recompra-stp-minis-reg_1_2022 = AAP1_DMC_BRA_recompra-stp-minis-step3-reg_1_2022
     when g.ga_campaign = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-reg = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-stepzicard-reg
     when g.ga_campaign = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa-stepzicard
     when g.ga_campaign = der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-reg = der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-step1-reg
     when g.ga_campaign = DMC_BRA_Shipping_Notification = DMC_BRA_Shipping_Notification-step1
     when g.ga_campaign = ACR2_DMC_BRA_ultracover-stp4m2200-reg_1_2023 = ACR2_DMC_BRA_ultracover-stp4m2200-semstep-reg_1_2023
     when g.ga_campaign = ACR2_DMC_BRA_ultracover-stp4-2200-reg_1_2023 = ACR2_DMC_BRA_ultracover-stp4-2200-step4-reg_1_2023
     when g.ga_campaign = ACR3_DMC_BRA_ultracover-stp4-2200-reg_1_2023 = ACR3_DMC_BRA_ultracover-stp4-2200-semstep-reg_1_2023
     when g.ga_campaign = AAD1_LRP_BRA_ultracover-stp4m2200-reg_1_2023 = AAD1_LRP_BRA_ultracover-stp4m2200-step4-reg_1_2023
     when g.ga_campaign = DMC_BRA_Boleto_NoPaid = DMC_BRA_Boleto_NoPaid-step1
     when g.ga_campaign = DMC_BRA_Boleto_Expired = DMC_BRA_Boleto_Expired-step1
     when g.ga_campaign = DMC_BRA_Boleto_Paid = DMC_BRA_Boleto_Paid-step1
     when g.ga_campaign = DMC_BRA_Abandoned_Cart = DMC_BRA_Abandoned_Cart-step1
     when g.ga_campaign = DMC_BRA_Account_Creation = DMC_BRA_Account_Creation-step1
     when g.ga_campaign = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-reg = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-stepzicard-reg
     when g.ga_campaign = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-reg = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-stepzicard-reg
     else g.ga_campaign
end as ga_campaign,













=================================================================================================================
=================================================================================================================
=================================================================================================================
=================================================================================================================

Criamos a tabela com o mesmo esquema que a Original de Customer:



CREATE TABLE enext-general.loreal_dca.dmc_customer_diario_fields AS
SELECT distinct CAST(Customer_ID as STRING) as Customer_ID,
CAST(customer_no as STRING) as customer_no,
first_name,
last_name,
email,
CAST(phone_mobile as STRING) as phone_mobile,
city,
state_code,
CAST(creation_date as STRING) as creation_date,
CAST(Email_Opt_In as STRING) as Email_Opt_In,
CAST(SMS_Opt_In as STRING) as SMS_Opt_In,
CAST(Phone_Opt_In as STRING) as Phone_Opt_In,
CAST(WhatsApp_Opt_in as STRING) as WhatsApp_Opt_in
FROM `enext-general.loreal_dca.dmc_customer_diario`
WHERE 1 = 0; -- Essa cláusula evita que os dados sejam realmente copiados, criando apenas a estrutura da tabela.


Logo, fazemos um insert sem duplicidade na tabela criada acima partindo dos valores da tabela original


INSERT INTO `enext-general.loreal_dca.dmc_customer_diario_fields` (Customer_ID,customer_no, first_name, last_name, email, phone_mobile, city, state_code, creation_date, Email_Opt_In, SMS_Opt_In, Phone_Opt_In, WhatsApp_Opt_in)
SELECT distinct CAST(Customer_ID as STRING) as Customer_ID,
CAST(customer_no as STRING) as customer_no,
first_name,
last_name,
email,
CAST(phone_mobile as STRING) as phone_mobile,
city,
state_code,
CAST(creation_date as STRING) as creation_date,
CAST(Email_Opt_In as STRING) as Email_Opt_In,
CAST(SMS_Opt_In as STRING) as SMS_Opt_In,
CAST(Phone_Opt_In as STRING) as Phone_Opt_In,
CAST(WhatsApp_Opt_in as STRING) as WhatsApp_Opt_in
FROM `enext-general.loreal_dca.dmc_customer_diario` as origem
WHERE NOT EXISTS(
  SELECT 1
  FROM `enext-general.loreal_dca.dmc_customer_diario_fields` as fields
  WHERE CAST(fields.Customer_ID as INT64) = origem.Customer_ID
)





=================================================================================================================
=================================================================================================================
=================================================================================================================
=================================================================================================================

Criamos a tabela com o mesmo esquema que a Original de Transaction:



CREATE TABLE enext-general.loreal_dca.dmc_transaction_diario_fields AS
SELECT distinct Customer_ID,
Transaction_ID,
Store_ID,
CONCAT(Store_ID, FORMAT_TIMESTAMP(%Y%m%d, Date), Customer_ID) as pedidos,
Brand,
product_name,
product_gross_price,
product_net_price,
Product_ID,
order_gross_price,
order_net_price,
Unit_Price,
Unit_Discount,
Total_Discount,
Sold_Amount,
DATE(FORMAT_TIMESTAMP(%Y-%m-%d, Date)) as DataPedido
FROM `enext-general.loreal_dca.dmc_transaction_diario`
WHERE 1 = 0;



Logo, fazemos um insert sem duplicidade na tabela criada acima partindo dos valores da tabela original



INSERT INTO `enext-general.loreal_dca.dmc_transaction_diario_fields` (Customer_ID, Transaction_ID, Store_ID, Brand, product_name, product_gross_price, product_net_price,Product_ID,
order_gross_price, order_net_price, Unit_Price, Unit_Discount, Total_Discount, Sold_Amount, DataPedido)
SELECT origem.Customer_ID,
origem.Transaction_ID,
origem.Store_ID,
origem.Brand,
origem.product_name,
origem.product_gross_price,
origem.product_net_price,
origem.Product_ID,
origem.order_gross_price,
origem.order_net_price,
origem.Unit_Price,
origem.Unit_Discount,
origem.Total_Discount,
origem.Sold_Amount,
DATE(FORMAT_TIMESTAMP(%Y-%m-%d, Date)) as DataPedido
FROM `enext-general.loreal_dca.dmc_transaction_diario` as origem
WHERE NOT EXISTS(
  SELECT 1
  FROM `enext-general.loreal_dca.dmc_transaction_diario_fields` as fields
  WHERE fields.Transaction_ID = origem.Transaction_ID
)











=================================================================================================================
=================================================================================================================
=================================================================================================================
=================================================================================================================

view_dmc_sfmc_consolidada



select
sendsfull.send_date as dDate, 
case when trim(sendsfull.emailname) = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(sendsfull.emailname) = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(sendsfull.emailname) = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(sendsfull.emailname) = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(sendsfull.emailname) = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg  = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-semstep-reg
     when trim(sendsfull.emailname) = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when trim(sendsfull.emailname) = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when trim(sendsfull.emailname) = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when trim(sendsfull.emailname) = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(sendsfull.emailname) = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when trim(sendsfull.emailname) = der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-step1-reg  = der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-semstep-reg
     when trim(sendsfull.emailname) = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-reg  = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step1-reg
     when trim(sendsfull.emailname) = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step5-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg
     when trim(sendsfull.emailname) = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step6-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step2-reg
     when trim(sendsfull.emailname) = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg
     when trim(sendsfull.emailname) = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-reg  = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-reg  = der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-step1-reg
     when trim(sendsfull.emailname) = AAL5_DMC_BRA_abandonecart-stp3-reg_2_2022  = AAL5_DMC_BRA_abandonecart-step2-reg_2_2022
     when trim(sendsfull.emailname) = der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-reg  = der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-reg  = der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-semstep-reg
     when trim(sendsfull.emailname) = der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-reg  = der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-step1-reg
     when trim(sendsfull.emailname) = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-rep-reg  = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step2-reg
     when trim(sendsfull.emailname) = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-reg  = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step1-reg
     when trim(sendsfull.emailname) = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-reg  = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step1-reg
     when trim(sendsfull.emailname) = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-rep-reg  = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step2-reg
     when trim(sendsfull.emailname) = der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-reg  = der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg  = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg
     when trim(sendsfull.emailname) = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg  = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg
     when trim(sendsfull.emailname) = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-reg  = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-rep-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg
     when trim(sendsfull.emailname) = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-rep-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg
     when trim(sendsfull.emailname) = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-reg
     when trim(sendsfull.emailname) = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-reg = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-reg = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-reg = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-reg = der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-step1-reg
     when trim(sendsfull.emailname) = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-reg = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step1-reg
     when trim(sendsfull.emailname) = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-rep-reg = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step2-reg
     when trim(sendsfull.emailname) = der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-reg = der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-step1-reg
     when trim(sendsfull.emailname) = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-reg = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-reg = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-reg = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-reg = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-reg = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-reg = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-02-reg = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step1-reg
     when trim(sendsfull.emailname) = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-03-reg = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step2-reg
     when trim(sendsfull.emailname) = der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-reg = der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-step1-reg
     when trim(sendsfull.emailname) = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-rep-reg = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step4-reg
     when trim(sendsfull.emailname) = AAO9_DMC_BRA_recompra-stp-refil-reg_1_2022 = AAO9_DMC_BRA_recompra-stp-refil-step3-reg_1_2022
     when trim(sendsfull.emailname) = AAP1_DMC_BRA_recompra-stp-minis-reg_1_2022 = AAP1_DMC_BRA_recompra-stp-minis-step3-reg_1_2022
     when trim(sendsfull.emailname) = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-reg = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa-stepzicard
     when trim(sendsfull.emailname) = der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-reg = der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-step1-reg
     when trim(sendsfull.emailname) = ACR2_DMC_BRA_ultracover-stp4m2200-reg_1_2023 = ACR2_DMC_BRA_ultracover-stp4m2200-semstep-reg_1_2023
     when trim(sendsfull.emailname) = ACR2_DMC_BRA_ultracover-stp4-2200-reg_1_2023 = ACR2_DMC_BRA_ultracover-stp4-2200-step4-reg_1_2023
     when trim(sendsfull.emailname) = ACR3_DMC_BRA_ultracover-stp4-2200-reg_1_2023 = ACR3_DMC_BRA_ultracover-stp4-2200-semstep-reg_1_2023
     when trim(sendsfull.emailname) = AAD1_LRP_BRA_ultracover-stp4m2200-reg_1_2023 = AAD1_LRP_BRA_ultracover-stp4m2200-step4-reg_1_2023
     when trim(sendsfull.emailname) = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-reg = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-stepzicard-reg
     when trim(sendsfull.emailname) = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-reg = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-stepzicard-reg
     else trim(sendsfull.emailname)
end as dCampanha,
MAX(sendsfull.subject) as subject,
MAX(sendsfull2.previewurl) as previewurl,
"salesforce / email" as sourcemedium,
"Email" as channelgrouping,
j.Lista as jornadaAgrupada, 
j.Cluster as tipoJornada, 
case when lower(sendsfull.rede) = pv = PANVEL 
     when lower(sendsfull.rede) = sp = DPSP
     when lower(sendsfull.rede) = pt = FARMACIA PERMANENTE
     when lower(sendsfull.rede) = rd = RAIA DROGASIL S/A.
     when lower(sendsfull.rede) = cl = CLAMED FARMACIAS
     when lower(sendsfull.rede) = tm = DROGARIA TAMOIO
     when lower(sendsfull.rede) = pm = DROG.PAGUE MENOS
     when lower(sendsfull.rede) = ns = FARMACIA E DROGARIA NISSEI S.A
     when lower(sendsfull.rede) = in = FARMACIA INDIANA
     when lower(sendsfull.rede) = sj = FARMACIAS SÃO JOÃO
     when lower(sendsfull.rede) = sk = E-BOUTIQUE SKC
     when lower(sendsfull.rede) = aj = DROGRARIA ARAUJO
     when lower(sendsfull.rede) = vn = GRUPO VENANCIO
     when lower(sendsfull.rede) = ml = D1000
     when lower(sendsfull.rede) = ek = EPOCA COSMETICOS
     when lower(sendsfull.rede) = ft = DROGAL FARMACEUTICA
     when lower(sendsfull.rede) = rs = DROGARIA ROSARIO
     when lower(sendsfull.rede) = ex = EXTRAFARMA
     when lower(sendsfull.rede) = dm or lower(sendsfull.rede) = dc = D2C DERMACLUB else Não Parametrizado end as rede,
  
  case when lower(sendsfull.marca) = cr = CeraVe
       when lower(sendsfull.marca) = lr = La Roche-Posay
       when lower(sendsfull.marca) = mm = Multimarcas
       when lower(sendsfull.marca) = sc = SkinCeuticals
       when lower(sendsfull.marca) = vy = Vichy
       when lower(sendsfull.marca) = dc = DMC else Não Parametrizado end as marca,

  case when lower(sendsfull.categoria) = ai = Anti Idade
       when lower(sendsfull.categoria) = ar = Antirrugas
       when lower(sendsfull.categoria) = cp = Capilar
       when lower(sendsfull.categoria) = hd = Hidratação
       when lower(sendsfull.categoria) = lp = Limpeza
       when lower(sendsfull.categoria) = mc = Multicategoria
       when lower(sendsfull.categoria) = sl = Solar
       when lower(sendsfull.categoria) = am = Antimanchas
       when lower(sendsfull.categoria) = aa = Antiacne
       when lower(sendsfull.categoria) = vc = Vitamina C
       when lower(sendsfull.categoria) = pq = Pesquisa else Não Parametrizado end as categoria,

  case when lower(sendsfull.tema) = 00 = DIA D
       when lower(sendsfull.tema) = 01 = DERMADRUGADA
       when lower(sendsfull.tema) = 02 = Alerta PROMO
       when lower(sendsfull.tema) = 01 = DERMADRUGADA
       when lower(sendsfull.tema) = 02 = Alerta PROMO
       when lower(sendsfull.tema) = 03 = Comprou Ganhou
       when lower(sendsfull.tema) = 04 = Conteúdo
       when lower(sendsfull.tema) = 05 = Desconto
       when lower(sendsfull.tema) = 06 = Pontuação
       when lower(sendsfull.tema) = 07 = Progressiva
       when lower(sendsfull.tema) = 08 = Lançamento
       when lower(sendsfull.tema) = 09 = Frete Grátis
       when lower(sendsfull.tema) = 10 = Pesquisa
       when lower(sendsfull.tema) = 11 = Promo Mês
       when lower(sendsfull.tema) = 12 = Promo Semana 
       when lower(sendsfull.tema) = 13 = Kits
       when lower(sendsfull.tema) = 14 = Comunicado
       when lower(sendsfull.tema) = 15 = DIA DO CONSUMIDOR
       when lower(sendsfull.tema) = 16 = REBAIXA TRADE
       when lower(sendsfull.tema) = 17 = CALENDÁRIO 360
       when lower(sendsfull.tema) = 18 = DIA DAS MULHERES
       when lower(sendsfull.tema) = 19 = Festival else Não Parametrizado end as tema,

  case when lower(sendsfull.exclusividade) = e = Exclusivo
       when lower(sendsfull.exclusividade) = n = Não Exclusivo else Não Parametrizado end as exclusividade,

  case when lower(sendsfull.segmentacao) = 000 = Engajados 90D
       when lower(sendsfull.segmentacao) = 001 = Engajados 180D
       when lower(sendsfull.segmentacao) = 002 = Engajados 360D
       when lower(sendsfull.segmentacao) = 003 = Carrinho Abandonado
       when lower(sendsfull.segmentacao) = 004 = Compradores Categoria
       when lower(sendsfull.segmentacao) = 005 = Compradores do Produto
       when lower(sendsfull.segmentacao) = 006 = Compradores Marca
       when lower(sendsfull.segmentacao) = 007 = Compradores Únicos
       when lower(sendsfull.segmentacao) = 008 = Cross Sell
       when lower(sendsfull.segmentacao) = 009 = Faixa Etária 45+
       when lower(sendsfull.segmentacao) = 010 = Não Compradores
       when lower(sendsfull.segmentacao) = 011 = Navegou e Não Comprou
       when lower(sendsfull.segmentacao) = 012 = Inativos
       when lower(sendsfull.segmentacao) = 013 = White
       when lower(sendsfull.segmentacao) = 014 = Ticket Médio Baixo 
       when lower(sendsfull.segmentacao) = 015 = Baixo Potencial
       when lower(sendsfull.segmentacao) = 016 = Potencial Frequência
       when lower(sendsfull.segmentacao) = 017 = Potencial Ticket Alto
       when lower(sendsfull.segmentacao) = 018 = Potencial Valor
       when lower(sendsfull.segmentacao) = 019 = Vip
       when lower(sendsfull.segmentacao) = 020 = Pontuação
       when lower(sendsfull.segmentacao) = 021 = Parceiros
       when lower(sendsfull.segmentacao) = 022 = Pós Vendas
       when lower(sendsfull.segmentacao) = 023 = Quem não abriu
       when lower(sendsfull.segmentacao) = 024 = Lead Ads
       when lower(sendsfull.segmentacao) = 025 = Beauty Profile
       when lower(sendsfull.segmentacao) = 026 = Desengajados
       when lower(sendsfull.segmentacao) = 027 = Clicou e Não Comprou
       when lower(sendsfull.segmentacao) = 028 = Faixa Etária 30+
       when lower(sendsfull.segmentacao) = 029 = Member Get Member
       when lower(sendsfull.segmentacao) = 030 = Engajado 90 dias clicantes
       when lower(sendsfull.segmentacao) = 031 = Homens
       when lower(sendsfull.segmentacao) = 032 = Fishing SDS
       when lower(sendsfull.segmentacao) = 033 = Região
       when lower(sendsfull.segmentacao) = 034 = Pele Oleosa
       when lower(sendsfull.segmentacao) = 035 = Pele Seca
       when lower(sendsfull.segmentacao) = 036 = Buscou Produto
       when lower(sendsfull.segmentacao) = 037 = Engajados Site 15d
       when lower(sendsfull.segmentacao) = 038 = Loyalts
       when lower(sendsfull.segmentacao) = 039 = Engajados 30D
       when lower(sendsfull.segmentacao) = 040 = Buscou pele acneia
       when lower(sendsfull.segmentacao) = 041 = Abandonou Produto
       when lower(sendsfull.segmentacao) = 042 = Compradores Desconto
       when lower(sendsfull.segmentacao) = 043 = Seg. Específica
       when lower(sendsfull.segmentacao) = 044 = Compradores LRP
       when lower(sendsfull.segmentacao) = 045 = Compradores Vichy
       when lower(sendsfull.segmentacao) = 046 = Compradores Cerave
       when lower(sendsfull.segmentacao) = 047 = Compradores SKC
       when lower(sendsfull.segmentacao) = 048 = Interesse Vitamina C
       when lower(sendsfull.segmentacao) = 049 = Compradores Kits 12 m
       when lower(sendsfull.segmentacao) = 050 = Compradores recorrentes 
       when lower(sendsfull.segmentacao) = 051 = Tipo de pele - Oleosa
       when lower(sendsfull.segmentacao) = 052 = Perfil de compra - Cupom
       when lower(sendsfull.segmentacao) = 053 = TIcket Médio 499
       when lower(sendsfull.segmentacao) = 054 = Compradores Skinday
       when lower(sendsfull.segmentacao) = 055 = Tipo de Pele - mista a oleo
       when lower(sendsfull.segmentacao) = 056 = Engaj 90d comprador
       when lower(sendsfull.segmentacao) = 057 = Tipo de Pele - madura
       when lower(sendsfull.segmentacao) = 058 = Interesse Acne
       when lower(sendsfull.segmentacao) = 059 = Tipo de Pele - Todos
       when lower(sendsfull.segmentacao) = 060 = Compradores de PDV
       when lower(sendsfull.segmentacao) = 061 = Fishing KER
       when lower(sendsfull.segmentacao) = 062 = Ativos
       when lower(sendsfull.segmentacao) = 063 = Retenção
       when lower(sendsfull.segmentacao) = 064 = Prospects
       when lower(sendsfull.segmentacao) = 065 = Sem Compra
       when lower(sendsfull.segmentacao) = 066 = Compradores D2C
       when lower(sendsfull.segmentacao) = 067 = Engajados 90 sem compra
       when lower(sendsfull.segmentacao) = 068 = Comp BF 2021
       when lower(sendsfull.segmentacao) = 069 = Comp BF 2020
       when lower(sendsfull.segmentacao) = 070 = Interesse Produto
       when lower(sendsfull.segmentacao) = 071 = consumers
       when lower(sendsfull.segmentacao) = 072 = Compradores Hidratação
       when lower(sendsfull.segmentacao) = 073 = Inativos Frios
       when lower(sendsfull.segmentacao) = 074 = Compradores Solar
       when lower(sendsfull.segmentacao) = 075 = Compradores Limpeza
       when lower(sendsfull.segmentacao) = 076 = Faixa Etária 18-35
       when lower(sendsfull.segmentacao) = 077 = Abandonou Silymarin
       when lower(sendsfull.segmentacao) = 078 = Compradores Silymarin
       when lower(sendsfull.segmentacao) = 079 = Compradores HAIntensifier
       when lower(sendsfull.segmentacao) = 080 = Compradores Proteção Solar
       when lower(sendsfull.segmentacao) = 081 = Ticket Acima 299
       when lower(sendsfull.segmentacao) = 082 = Compradores Blemish
       when lower(sendsfull.segmentacao) = 083 = Compradores Vitamina C
       when lower(sendsfull.segmentacao) = 084 = Compradores Ferulic
       when lower(sendsfull.segmentacao) = 085 = Navegou e não Comprou 90d
       when lower(sendsfull.segmentacao) = 086 = Compradores RJ 499 6m
       when lower(sendsfull.segmentacao) = 087 = Ticket Acima 399
       when lower(sendsfull.segmentacao) = 088 = Navegou e Não Comprou Kits 90d
       when lower(sendsfull.segmentacao) = 089 = Interesse Solar
       when lower(sendsfull.segmentacao) = 090 = Interesse AA
       when lower(sendsfull.segmentacao) = 091 = Interesse Blemish
       when lower(sendsfull.segmentacao) = 092 = Comp BF 2022
       when lower(sendsfull.segmentacao) = 093 = Compradores RD
       when lower(sendsfull.segmentacao) = 094 = TIcket Médio >269
       when lower(sendsfull.segmentacao) = 095 = Compradores Mineral 89
       when lower(sendsfull.segmentacao) = 096 = Mulheres
       when lower(sendsfull.segmentacao) = 097 = TIcket Médio >149
       when lower(sendsfull.segmentacao) = 098 = Compradores Phyto
       when lower(sendsfull.segmentacao) = 099 = Compradores AA
       when lower(sendsfull.segmentacao) = 100 = Compradores de SKC em RD
       when lower(sendsfull.segmentacao) = 101 = Compradores de LRP em RD
       when lower(sendsfull.segmentacao) = 102 = Compradores de VCH em RD
       when lower(sendsfull.segmentacao) = 103 = Compradores Panvel
       when lower(sendsfull.segmentacao) = 104 = Compradores Venancio
       when lower(sendsfull.segmentacao) = 105 = Mulheres Ativas
       when lower(sendsfull.segmentacao) = 106 = Compradores de LRP em RAIA
       when lower(sendsfull.segmentacao) = 107 = Compradores de LRP em Panvel
       when lower(sendsfull.segmentacao) = 108 = Compradores de LRP em d2c
       when lower(sendsfull.segmentacao) = 109 = Compradores de LRP em Venancio s/ compra no mês
       when lower(sendsfull.segmentacao) = 110 = Compradores Anti Oleosidade
       when lower(sendsfull.segmentacao) = 111 = Split de 30mil de Desengajados 180d
       when lower(sendsfull.segmentacao) = 112 = Compradores Pele Oleosa
       when lower(sendsfull.segmentacao) = 113 = Compradores Últimos 30d
       when lower(sendsfull.segmentacao) = 114 = Compradores 6 meses sem compra
       when lower(sendsfull.segmentacao) = 115 = Reequilibrante
       when lower(sendsfull.segmentacao) = 116 = Compradores Raia com freq>2
       when lower(sendsfull.segmentacao) = 117 = Compradores Totais com freq>2
       when lower(sendsfull.segmentacao) = 118 = Prospects Raia
       when lower(sendsfull.segmentacao) = 119 = Compradore Ultracover
       when lower(sendsfull.segmentacao) = 120 = 50% dos Prospects
       when lower(sendsfull.segmentacao) = 121 = Compradores Dercos
       when lower(sendsfull.segmentacao) = 122 = Compradores Raia
       when lower(sendsfull.segmentacao) = 123 = Dormants
       when lower(sendsfull.segmentacao) = 124 = Casual
       when lower(sendsfull.segmentacao) = 125 = Dormants GC
       when lower(sendsfull.segmentacao) = 126 = Casul GC
       when lower(sendsfull.segmentacao) = 127 = Compradores DPSP
       when lower(sendsfull.segmentacao) = 128 = Compradores Resgate
       when lower(sendsfull.segmentacao) = 129 = New Prospects
       when lower(sendsfull.segmentacao) = 130 = Casual WEEKLY
       when lower(sendsfull.segmentacao) = 131 = Dormants WEEKLY
       when lower(sendsfull.segmentacao) = 132 = Casual Controle WEEKLY
       when lower(sendsfull.segmentacao) = 133 = Dormants Control WEEKLY
       when lower(sendsfull.segmentacao) = 134 = Compradores Farmacia Parceira
       when lower(sendsfull.segmentacao) = 135 = Respondeu Pesquisa Parceiro
       when lower(sendsfull.segmentacao) = 136 = Compradores Cerave SP
       when lower(sendsfull.segmentacao) = 137 = Compradores Dermaclub SP
       when lower(sendsfull.segmentacao) = 138 = Compradores Festival Inverno else Não Parametrizado end as segmentacao,

 case when lower(sendsfull.tipo) = brd = Broadcast
      when lower(sendsfull.tipo) = bra = Broadcast Teste A
      when lower(sendsfull.tipo) = brb = Broadcast Teste B
      when lower(sendsfull.tipo) = rep = Repique
      when lower(sendsfull.tipo) = seg = Segmentado
      when lower(sendsfull.tipo) = sea = Segmentado Teste A
      when lower(sendsfull.tipo) = seb = Segmentado Teste B
      when lower(sendsfull.tipo) = ctr = Grupo de Controle
      when lower(sendsfull.tipo) = tmp = Template
      when lower(sendsfull.tipo) = dng = Desengajado
      when lower(sendsfull.tipo) = sms = SMS
      when lower(sendsfull.tipo) = reg = Jornada
      when lower(sendsfull.tipo) = rea = Jornada Teste A
      when lower(sendsfull.tipo) = reb = Jornada Teste B
      when lower(sendsfull.tipo) = req = Jornada Repique
      when lower(sendsfull.tipo) = ert = Errata
      when lower(sendsfull.tipo) = dor = Doments
      when lower(sendsfull.tipo) = cas = Casuals else Não Parametrizado end as tipo,

SUM(sends) as envios,
SUM(deliveries) as entregues,
SUM(uniqueOpens) as opens,
SUM(uniqueClicks) as clicks,
SUM(uniqueUnsubscribes) as unsubscribes,
SUM(bounces) as bounces


from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as sendsfull
left join (
  select   teste.emailname,
           MAX(teste.previewurl) as previewurl 
  from     `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` teste
  group by 1
) AS sendsfull2 ON sendsfull.emailname = sendsfull2.emailname
left join `enext-datarepository.loreal_dca.dmc_dicionario_jornadas` as j
on lower(TRIM(sendsfull.emailname)) = lower(TRIM(j.Codigo))

where sendsfull.send_date is not NULL 
and sendsfull.send_date >= 2022-01-01

group by 1,2,5,6,7,8,9,10,11,12,13,14,15











=================================================================================================================
=================================================================================================================
=================================================================================================================
=================================================================================================================








select   g.ga_date as dDate,
case when trim(g.ga_campaign) = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(g.ga_campaign) = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(g.ga_campaign) = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(g.ga_campaign) = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg  = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(g.ga_campaign) = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg  = der_othr_aniversario_xxxxxx-br-dpp-b2c-der-generic-birthday-semstep-reg
     when trim(g.ga_campaign) = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario1a7_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when trim(g.ga_campaign) = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario8a25_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when trim(g.ga_campaign) = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-02-reg  = der_othr_aniversario26a31_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when trim(g.ga_campaign) = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-01-reg = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step1-reg
     when trim(g.ga_campaign) = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-03-reg = der_othr_aniversarioPasso1e3_xxxxxx-br-dpp-b2c-der-generic-birthday-step2-reg
     when trim(g.ga_campaign) = der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-step1-reg  = der_othr_antiChurn_xxxxxx-br-dpp-b2c-der-lifecycle-retained-customers-anti-churn-semstep-reg
     when trim(g.ga_campaign) = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-reg  = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step1-reg
     when trim(g.ga_campaign) = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step5-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg
     when trim(g.ga_campaign) = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step6-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step2-reg
     when trim(g.ga_campaign) = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step3-reg  = der_othr_boasVindas_xxxxxx-br-acd-b2c-der-lifecycle-new-customers-boasVindas-step4-reg
     when trim(g.ga_campaign) = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-reg  = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome5-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-reg  = der_othr_abandonecart_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart-step1-reg
     when trim(g.ga_campaign) = AAL5_DMC_BRA_abandonecart-stp3-reg_2_2022  = AAL5_DMC_BRA_abandonecart-step2-reg_2_2022
     when trim(g.ga_campaign) = der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-reg  = der_othr_abandonecartLTY_xxxxxx-br-acd-b2c-der-lifecycle-procedure-abandonecart01-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-reg  = der_othr_abandonecartLTY_xxxxxx-br-dpp-b2c-der-lifecycle-procedure-abandonecart01-semstep-reg
     when trim(g.ga_campaign) = der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-reg  = der_othr_sempontuacao_xxxxxx-br-acd-b2c-der-transactional-compra-sem-pontuacao-step1-reg
     when trim(g.ga_campaign) = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-rep-reg  = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step2-reg
     when trim(g.ga_campaign) = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-reg  = der_othr_compRecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-step1-reg
     when trim(g.ga_campaign) = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-reg  = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step1-reg
     when trim(g.ga_campaign) = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-rep-reg  = der_othr_compUnico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-step2-reg
     when trim(g.ga_campaign) = der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-reg  = der_othr_confirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-optin-ConfirmEmailLembrete-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg  = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg
     when trim(g.ga_campaign) = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step2-reg  = der_othr_CrossSell_xxxxxx-br-acd-b2c-der-procedure-CrossSell-step1-reg
     when trim(g.ga_campaign) = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-reg  = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-rep-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg
     when trim(g.ga_campaign) = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-rep-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-step3-rep-reg
     when trim(g.ga_campaign) = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step2-reg = der_othr_engSemCompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engSemCompra-step1-reg
     when trim(g.ga_campaign) = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-reg = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-reg = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-reg = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-reg = der_othr_navNaoComp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-step1-reg
     when trim(g.ga_campaign) = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-reg = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step1-reg
     when trim(g.ga_campaign) = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-rep-reg = der_othr_nps_xxxxxx-br-acd-b2c-der-procedure-rating-nps-form-step2-reg
     when trim(g.ga_campaign) = der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-reg = der_othr_npsstep2_xxxxxx-br-acd-b2c-der-procedure-rating-answer-nps-step1-reg
     when trim(g.ga_campaign) = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-reg = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-reg = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-reg = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-reg = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-reg = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-reg = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-02-reg = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step1-reg
     when trim(g.ga_campaign) = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-03-reg = der_othr_primeiroResgate_xxxxxx-br-dpp-b2c-der-procedure-redemptionroutine-RotinaDeResgate-step2-reg
     when trim(g.ga_campaign) = der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-reg = der_othr_productReview_xxxxxx-br-acd-b2c-der-procedure-rating-productReview-step1-reg
     when trim(g.ga_campaign) = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-rep-reg = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step4-reg
     when trim(g.ga_campaign) = AAO9_DMC_BRA_recompra-stp-refil-reg_1_2022 = AAO9_DMC_BRA_recompra-stp-refil-step3-reg_1_2022
     when trim(g.ga_campaign) = AAP1_DMC_BRA_recompra-stp-minis-reg_1_2022 = AAP1_DMC_BRA_recompra-stp-minis-step3-reg_1_2022
     when trim(g.ga_campaign) = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-reg = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transa-stepzicard
     when trim(g.ga_campaign) = der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-reg = der_othr_resgNaoAprovado_xxxxxx-br-acd-b2c-der-procedure-resgNaoAprovado-step1-reg
     when trim(g.ga_campaign) = DMC_BRA_Shipping_Notification = DMC_BRA_Shipping_Notification-step1
     when trim(g.ga_campaign) = ACR2_DMC_BRA_ultracover-stp4m2200-reg_1_2023 = ACR2_DMC_BRA_ultracover-stp4m2200-semstep-reg_1_2023
     when trim(g.ga_campaign) = ACR2_DMC_BRA_ultracover-stp4-2200-reg_1_2023 = ACR2_DMC_BRA_ultracover-stp4-2200-step4-reg_1_2023
     when trim(g.ga_campaign) = ACR3_DMC_BRA_ultracover-stp4-2200-reg_1_2023 = ACR3_DMC_BRA_ultracover-stp4-2200-semstep-reg_1_2023
     when trim(g.ga_campaign) = AAD1_LRP_BRA_ultracover-stp4m2200-reg_1_2023 = AAD1_LRP_BRA_ultracover-stp4m2200-step4-reg_1_2023
     when trim(g.ga_campaign) = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-reg = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome4-stepzicard-reg
     when trim(g.ga_campaign) = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-reg = der_othr_welcome_xxxxxx-br-dpp-b2c-der-lifecycle-new-consumers-Welcome3-stepzicard-reg
     else trim(g.ga_campaign)
end as dCampanha,
CAST(null as string) as subject,
CAST(null as string) as previewurl,
g.ga_sourcemedium as sourcemedium,
g.ga_channelgrouping as channelgrouping,
  j.Lista as jornadaAgrupada, 
  j.Cluster as tipoJornada,
  case when lower(g.rede) = pv = PANVEL 
       when lower(g.rede) = sp = DPSP
       when lower(g.rede) = pt = FARMACIA PERMANENTE
       when lower(g.rede) = rd = RAIA DROGASIL S/A.
       when lower(g.rede) = cl = CLAMED FARMACIAS
       when lower(g.rede) = tm = DROGARIA TAMOIO
       when lower(g.rede) = pm = DROG.PAGUE MENOS
       when lower(g.rede) = ns = FARMACIA E DROGARIA NISSEI S.A
       when lower(g.rede) = in = FARMACIA INDIANA
       when lower(g.rede) = sj = FARMACIAS SÃO JOÃO
       when lower(g.rede) = sk = E-BOUTIQUE SKC
       when lower(g.rede) = aj = DROGRARIA ARAUJO
       when lower(g.rede) = vn = GRUPO VENANCIO
       when lower(g.rede) = ml = D1000
       when lower(g.rede) = ek = EPOCA COSMETICOS
       when lower(g.rede) = ft = DROGAL FARMACEUTICA
       when lower(g.rede) = rs = DROGARIA ROSARIO
       when lower(g.rede) = ex = EXTRAFARMA
       when lower(g.rede) = dm or lower(g.rede) = dc = D2C DERMACLUB else Não Parametrizado end as rede,
    
  case when lower(g.marca) = cr = CeraVe
       when lower(g.marca) = lr = La Roche-Posay
       when lower(g.marca) = mm = Multimarcas
       when lower(g.marca) = sc = SkinCeuticals
       when lower(g.marca) = vy = Vichy
       when lower(g.marca) = dc = DMC else Não Parametrizado end as marca,

  case when lower(g.categoria) = ai = Anti Idade
       when lower(g.categoria) = ar = Antirrugas
       when lower(g.categoria) = cp = Capilar
       when lower(g.categoria) = hd = Hidratação
       when lower(g.categoria) = lp = Limpeza
       when lower(g.categoria) = mc = Multicategoria
       when lower(g.categoria) = sl = Solar
       when lower(g.categoria) = am = Antimanchas
       when lower(g.categoria) = aa = Antiacne
       when lower(g.categoria) = vc = Vitamina C
       when lower(g.categoria) = pq = Pesquisa else Não Parametrizado end as categoria,

  case when lower(g.tema) = 00 = DIA D
       when lower(g.tema) = 01 = DERMADRUGADA
       when lower(g.tema) = 02 = Alerta PROMO
       when lower(g.tema) = 01 = DERMADRUGADA
       when lower(g.tema) = 02 = Alerta PROMO
       when lower(g.tema) = 03 = Comprou Ganhou
       when lower(g.tema) = 04 = Conteúdo
       when lower(g.tema) = 05 = Desconto
       when lower(g.tema) = 06 = Pontuação
       when lower(g.tema) = 07 = Progressiva
       when lower(g.tema) = 08 = Lançamento
       when lower(g.tema) = 09 = Frete Grátis
       when lower(g.tema) = 10 = Pesquisa
       when lower(g.tema) = 11 = Promo Mês
       when lower(g.tema) = 12 = Promo Semana 
       when lower(g.tema) = 13 = Kits
       when lower(g.tema) = 14 = Comunicado
       when lower(g.tema) = 15 = DIA DO CONSUMIDOR
       when lower(g.tema) = 16 = REBAIXA TRADE
       when lower(g.tema) = 17 = CALENDÁRIO 360
       when lower(g.tema) = 18 = DIA DAS MULHERES
       when lower(g.tema) = 19 = Festival else Não Parametrizado end as tema,

  case when lower(g.exclusividade) = e = Exclusivo
       when lower(g.exclusividade) = n = Não Exclusivo else Não Parametrizado end as exclusividade,

  case when lower(g.segmentacao) = 000 = Engajados 90D
       when lower(g.segmentacao) = 001 = Engajados 180D
       when lower(g.segmentacao) = 002 = Engajados 360D
       when lower(g.segmentacao) = 003 = Carrinho Abandonado
       when lower(g.segmentacao) = 004 = Compradores Categoria
       when lower(g.segmentacao) = 005 = Compradores do Produto
       when lower(g.segmentacao) = 006 = Compradores Marca
       when lower(g.segmentacao) = 007 = Compradores Únicos
       when lower(g.segmentacao) = 008 = Cross Sell
       when lower(g.segmentacao) = 009 = Faixa Etária 45+
       when lower(g.segmentacao) = 010 = Não Compradores
       when lower(g.segmentacao) = 011 = Navegou e Não Comprou
       when lower(g.segmentacao) = 012 = Inativos
       when lower(g.segmentacao) = 013 = White
       when lower(g.segmentacao) = 014 = Ticket Médio Baixo 
       when lower(g.segmentacao) = 015 = Baixo Potencial
       when lower(g.segmentacao) = 016 = Potencial Frequência
       when lower(g.segmentacao) = 017 = Potencial Ticket Alto
       when lower(g.segmentacao) = 018 = Potencial Valor
       when lower(g.segmentacao) = 019 = Vip
       when lower(g.segmentacao) = 020 = Pontuação
       when lower(g.segmentacao) = 021 = Parceiros
       when lower(g.segmentacao) = 022 = Pós Vendas
       when lower(g.segmentacao) = 023 = Quem não abriu
       when lower(g.segmentacao) = 024 = Lead Ads
       when lower(g.segmentacao) = 025 = Beauty Profile
       when lower(g.segmentacao) = 026 = Desengajados
       when lower(g.segmentacao) = 027 = Clicou e Não Comprou
       when lower(g.segmentacao) = 028 = Faixa Etária 30+
       when lower(g.segmentacao) = 029 = Member Get Member
       when lower(g.segmentacao) = 030 = Engajado 90 dias clicantes
       when lower(g.segmentacao) = 031 = Homens
       when lower(g.segmentacao) = 032 = Fishing SDS
       when lower(g.segmentacao) = 033 = Região
       when lower(g.segmentacao) = 034 = Pele Oleosa
       when lower(g.segmentacao) = 035 = Pele Seca
       when lower(g.segmentacao) = 036 = Buscou Produto
       when lower(g.segmentacao) = 037 = Engajados Site 15d
       when lower(g.segmentacao) = 038 = Loyalts
       when lower(g.segmentacao) = 039 = Engajados 30D
       when lower(g.segmentacao) = 040 = Buscou pele acneia
       when lower(g.segmentacao) = 041 = Abandonou Produto
       when lower(g.segmentacao) = 042 = Compradores Desconto
       when lower(g.segmentacao) = 043 = Seg. Específica
       when lower(g.segmentacao) = 044 = Compradores LRP
       when lower(g.segmentacao) = 045 = Compradores Vichy
       when lower(g.segmentacao) = 046 = Compradores Cerave
       when lower(g.segmentacao) = 047 = Compradores SKC
       when lower(g.segmentacao) = 048 = Interesse Vitamina C
       when lower(g.segmentacao) = 049 = Compradores Kits 12 m
       when lower(g.segmentacao) = 050 = Compradores recorrentes 
       when lower(g.segmentacao) = 051 = Tipo de pele - Oleosa
       when lower(g.segmentacao) = 052 = Perfil de compra - Cupom
       when lower(g.segmentacao) = 053 = TIcket Médio 499
       when lower(g.segmentacao) = 054 = Compradores Skinday
       when lower(g.segmentacao) = 055 = Tipo de Pele - mista a oleo
       when lower(g.segmentacao) = 056 = Engaj 90d comprador
       when lower(g.segmentacao) = 057 = Tipo de Pele - madura
       when lower(g.segmentacao) = 058 = Interesse Acne
       when lower(g.segmentacao) = 059 = Tipo de Pele - Todos
       when lower(g.segmentacao) = 060 = Compradores de PDV
       when lower(g.segmentacao) = 061 = Fishing KER
       when lower(g.segmentacao) = 062 = Ativos
       when lower(g.segmentacao) = 063 = Retenção
       when lower(g.segmentacao) = 064 = Prospects
       when lower(g.segmentacao) = 065 = Sem Compra
       when lower(g.segmentacao) = 066 = Compradores D2C
       when lower(g.segmentacao) = 067 = Engajados 90 sem compra
       when lower(g.segmentacao) = 068 = Comp BF 2021
       when lower(g.segmentacao) = 069 = Comp BF 2020
       when lower(g.segmentacao) = 070 = Interesse Produto
       when lower(g.segmentacao) = 071 = consumers
       when lower(g.segmentacao) = 072 = Compradores Hidratação
       when lower(g.segmentacao) = 073 = Inativos Frios
       when lower(g.segmentacao) = 074 = Compradores Solar
       when lower(g.segmentacao) = 075 = Compradores Limpeza
       when lower(g.segmentacao) = 076 = Faixa Etária 18-35
       when lower(g.segmentacao) = 077 = Abandonou Silymarin
       when lower(g.segmentacao) = 078 = Compradores Silymarin
       when lower(g.segmentacao) = 079 = Compradores HAIntensifier
       when lower(g.segmentacao) = 080 = Compradores Proteção Solar
       when lower(g.segmentacao) = 081 = Ticket Acima 299
       when lower(g.segmentacao) = 082 = Compradores Blemish
       when lower(g.segmentacao) = 083 = Compradores Vitamina C
       when lower(g.segmentacao) = 084 = Compradores Ferulic
       when lower(g.segmentacao) = 085 = Navegou e não Comprou 90d
       when lower(g.segmentacao) = 086 = Compradores RJ 499 6m
       when lower(g.segmentacao) = 087 = Ticket Acima 399
       when lower(g.segmentacao) = 088 = Navegou e Não Comprou Kits 90d
       when lower(g.segmentacao) = 089 = Interesse Solar
       when lower(g.segmentacao) = 090 = Interesse AA
       when lower(g.segmentacao) = 091 = Interesse Blemish
       when lower(g.segmentacao) = 092 = Comp BF 2022
       when lower(g.segmentacao) = 093 = Compradores RD
       when lower(g.segmentacao) = 094 = TIcket Médio >269
       when lower(g.segmentacao) = 095 = Compradores Mineral 89
       when lower(g.segmentacao) = 096 = Mulheres
       when lower(g.segmentacao) = 097 = TIcket Médio >149
       when lower(g.segmentacao) = 098 = Compradores Phyto
       when lower(g.segmentacao) = 099 = Compradores AA
       when lower(g.segmentacao) = 100 = Compradores de SKC em RD
       when lower(g.segmentacao) = 101 = Compradores de LRP em RD
       when lower(g.segmentacao) = 102 = Compradores de VCH em RD
       when lower(g.segmentacao) = 103 = Compradores Panvel
       when lower(g.segmentacao) = 104 = Compradores Venancio
       when lower(g.segmentacao) = 105 = Mulheres Ativas
       when lower(g.segmentacao) = 106 = Compradores de LRP em RAIA
       when lower(g.segmentacao) = 107 = Compradores de LRP em Panvel
       when lower(g.segmentacao) = 108 = Compradores de LRP em d2c
       when lower(g.segmentacao) = 109 = Compradores de LRP em Venancio s/ compra no mês
       when lower(g.segmentacao) = 110 = Compradores Anti Oleosidade
       when lower(g.segmentacao) = 111 = Split de 30mil de Desengajados 180d
       when lower(g.segmentacao) = 112 = Compradores Pele Oleosa
       when lower(g.segmentacao) = 113 = Compradores Últimos 30d
       when lower(g.segmentacao) = 114 = Compradores 6 meses sem compra
       when lower(g.segmentacao) = 115 = Reequilibrante
       when lower(g.segmentacao) = 116 = Compradores Raia com freq>2
       when lower(g.segmentacao) = 117 = Compradores Totais com freq>2
       when lower(g.segmentacao) = 118 = Prospects Raia
       when lower(g.segmentacao) = 119 = Compradore Ultracover
       when lower(g.segmentacao) = 120 = 50% dos Prospects
       when lower(g.segmentacao) = 121 = Compradores Dercos
       when lower(g.segmentacao) = 122 = Compradores Raia
       when lower(g.segmentacao) = 123 = Dormants
       when lower(g.segmentacao) = 124 = Casual
       when lower(g.segmentacao) = 125 = Dormants GC
       when lower(g.segmentacao) = 126 = Casul GC
       when lower(g.segmentacao) = 127 = Compradores DPSP
       when lower(g.segmentacao) = 128 = Compradores Resgate
       when lower(g.segmentacao) = 129 = New Prospects
       when lower(g.segmentacao) = 130 = Casual WEEKLY
       when lower(g.segmentacao) = 131 = Dormants WEEKLY
       when lower(g.segmentacao) = 132 = Casual Controle WEEKLY
       when lower(g.segmentacao) = 133 = Dormants Control WEEKLY
       when lower(g.segmentacao) = 134 = Compradores Farmacia Parceira
       when lower(g.segmentacao) = 135 = Respondeu Pesquisa Parceiro
       when lower(g.segmentacao) = 136 = Compradores Cerave SP
       when lower(g.segmentacao) = 137 = Compradores Dermaclub SP
       when lower(g.segmentacao) = 138 = Compradores Festival Inverno else Não Parametrizado end as segmentacao,

 case when lower(g.tipo) = brd = Broadcast
      when lower(g.tipo) = bra = Broadcast Teste A
      when lower(g.tipo) = brb = Broadcast Teste B
      when lower(g.tipo) = rep = Repique
      when lower(g.tipo) = seg = Segmentado
      when lower(g.tipo) = sea = Segmentado Teste A
      when lower(g.tipo) = seb = Segmentado Teste B
      when lower(g.tipo) = ctr = Grupo de Controle
      when lower(g.tipo) = tmp = Template
      when lower(g.tipo) = dng = Desengajado
      when lower(g.tipo) = sms = SMS
      when lower(g.tipo) = reg = Jornada
      when lower(g.tipo) = rea = Jornada Teste A
      when lower(g.tipo) = reb = Jornada Teste B
      when lower(g.tipo) = req = Jornada Repique
      when lower(g.tipo) = ert = Errata
      when lower(g.tipo) = dor = Doments
      when lower(g.tipo) = cas = Casuals else Não Parametrizado end as tipo,


  SUM(g.ga_sessions) as sessions,
  SUM(g.ga_transactions) as transactions,
  SUM(g.ga_transactionrevenue) as revenue,
  SUM(g.ga_itemquantity) as itemquantity
  
from `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as g
left join `enext-datarepository.loreal_dca.dmc_dicionario_jornadas` as j
on lower(trim(g.ga_campaign)) = lower(trim(j.Codigo))


where g.ga_date is not NULL 
and g.ga_date >= 2022-01-01

group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

=================================================================================================================
=================================================================================================================
=================================================================================================================
=================================================================================================================


Validação de Valores em detalhamento dentro do dash



select dCampanha, round(SUM(revenue),2) as receita, SUM(sessions) as sessoes, SUM(transactions) as transacoes from `enext-datarepository.loreal_dca.view_dmc_all_sources`
where dDate >= 2023-07-01 and dDate <= 2023-07-20
/*and CASE
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-REG|XXXXXX|-REA|-REB|-REQ) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-REP-REG) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Abandoned_Cart) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Boleto_Paid) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Boleto_Expired) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Boleto_NoPaid) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Payment_Confirmed_Pix) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Rejected_Payment) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Cancelled) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Order_Status_Brain) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Return) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Shipping_Notification) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Account_Creation) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Newsletter) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-BROAD|BRD|BROA|BRB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-SEG|-SEA|-SEB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-TEMP|-TMP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-DNG) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-REP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-ERT) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-DOR) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-CAS) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-CTR) = "Broadcast"
  ELSE "Broadcast"
  END = Broadcast
#and rede = GRUPO VENANCIO*/
and dCampanha not like %(not set)%
and dCampanha like ba_%
group by 1
order by 1 desc










select dCampanha, 
CASE
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-REG|XXXXXX|-REA|-REB|-REQ) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-REP-REG) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Abandoned_Cart) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Boleto_Paid) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Boleto_Expired) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Boleto_NoPaid) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Payment_Confirmed_Pix) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Rejected_Payment) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Cancelled) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Order_Status_Brain) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Return) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Shipping_Notification) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Account_Creation) = "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,DMC_BRA_Newsletter) = "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-BROAD|BRD|BROA|BRB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-SEG|-SEA|-SEB) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-TEMP|-TMP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-DNG) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-REP) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-ERT) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-DOR) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-CAS) = "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),-CTR) = "Broadcast"
  ELSE "Broadcast"
  END as TipoEmail,

sourcemedium, channelgrouping, rede, marca, tema, exclusividade, tipo,categoria, 

from `enext-datarepository.loreal_dca.view_dmc_ga_consolidado`
where dDate >= 2023-07-01 and dDate <= 2023-07-20

  and sourcemedium like %crm% or sourcemedium like %email% or sourcemedium like %salesforce% 

#and dCampanha = AAH4_VIC_BRA_min89-baixopotencial-seg_1_2023

  group by dCampanha, sourcemedium, channelgrouping, rede, marca, tema, exclusividade, tipo,categoria

  order by 8 desc

==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================





  select g.ga_campaign, ROUND(SUM(g.ga_transactionrevenue),2), SUM(g.ga_sessions) from `enext-datarepository.loreal_dca.dmc_ga_campaign_full` as g
where ga_date >= 2023-07-01 and ga_date <= 2023-07-20
and g.ga_campaign not like %not set%
and g.ga_campaign like ba_%
group by 1
order by 2 desc




RPS: sum(Receita)/sum(Envios)
AOV: sum(Receita)/sum(Transacoes)
OR: sum(Aberturas)/sum(Entregues)
CTOR: sum(Cliques)/sum(Aberturas)
CTR: sum(Cliques)/sum(Envios)
TX. Conversão: sum(Transacoes)/sum(Sessoes)
DR: sum(Entregues)/sum(Envios)


#where dDate >= 2023-07-01 and dDate <= 2023-07-23 #fato.dCampanha like %AEL5_DMC_BRA_D2C-DM-VY-CP-03-E-064-SEG_1_2023%

and g.ga_campaign like %AEL5_DMC_BRA_D2C-DM-VY-CP-03-E-064-SEG_1_2023%    









SELECT 
CAST(origem.Customer_ID as STRING) as Customer_ID,
CAST(origem.Transaction_ID as STRING) as Transaction_ID,
CAST(origem.Store_ID as STRING) as Store_ID,
CAST(origem.Brand as STRING) as Brand,
CONCAT(Store_ID, FORMAT_DATE(%Y%m%d, DataPedido) ,Customer_ID) as pedidos,
origem.product_name,
CAST(origem.product_gross_price as STRING) as product_gross_price,
origem.product_net_price,
CAST(origem.Product_ID as STRING) as Product_ID,
origem.order_gross_price,
origem.order_net_price,
origem.Unit_Price,
origem.Unit_Discount,
origem.Total_Discount,
origem.Sold_Amount,
DataPedido
FROM `enext-general.loreal_dca.dmc_transaction_diario_fields` as origem

where origem.DataPedido >= 2023-08-01

UNION ALL

SELECT 
h.Customer_ID,
h.Transaction_ID,
h.Store_ID,
CAST(h.Brand as STRING) as Brand,
pedidos,
h.product_name,
CASE when h.product_gross_price = <null> = null else h.product_gross_price end as product_gross_price,
CAST(REPLACE((CASE when h.product_net_price = <null> = null else h.product_net_price end),"","") as FLOAT64) as product_net_price,
REPLACE((CASE when h.Product_ID = <null> = null else h.Product_ID end),"","") as Product_ID,
CAST((CASE when h.order_gross_price = <null> = null else h.order_gross_price end) as FLOAT64) as order_gross_price,
CAST(h.order_net_price as FLOAT64) as order_net_price,
CAST(REPLACE(h.Unit_Price,"","") as FLOAT64) as Unit_Price,
CAST(REPLACE(h.Unit_Discount,"","") as FLOAT64) as Unit_Discount,
CAST(REPLACE(h.Total_Discount,"","") as FLOAT64) as Total_Discount,
CAST(REPLACE(h.Sold_Amount,"","") as INT64) as Sold_Amount,
CAST((CASE when h.datapedido = <null> = null else h.datapedido end) as Date) as datapedido
FROM `enext-general.loreal_dca.dmc_transactions_historico` as h

where CAST((CASE when h.datapedido = <null> = null else h.datapedido end) as Date) >= 2022-01-01
  and CAST((CASE when h.datapedido = <null> = null else h.datapedido end) as Date) <= 2023-07-31
  



==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================



select 
d.Customer_ID,
d.customer_no,
d.first_name,
d.last_name,
d.email,
d.phone_mobile,
d.city,
d.state_code,
d.Email_Opt_In,
d.SMS_Opt_In,
d.Phone_Opt_In,
d.WhatsApp_Opt_in,
DATE(FORMAT_TIMESTAMP(%Y-%m-%d, CAST(d.creation_date as TIMESTAMP))) as creation_date

from `enext-general.loreal_dca.dmc_customer_diario_fields` as d

where DATE(FORMAT_TIMESTAMP(%Y-%m-%d, CAST(d.creation_date as TIMESTAMP))) >= 2023-07-31


UNION ALL

select 
h.Customer_ID,
h.customer_no,
h.first_name,
h.last_name,
h.email,
h.phone_mobile,
h.city,
h.state_code,
lower(h.Email_Opt_In) as Email_Opt_In,
lower(h.SMS_Opt_In) as SMS_Opt_In,
lower(h.Phone_Opt_In) as Phone_Opt_In,
lower(h.WhatsApp_Opt_in) as WhatsApp_Opt_in,
DATE(FORMAT_TIMESTAMP(%Y-%m-%d, CAST(h.creation_date as TIMESTAMP))) as creation_date

from `enext-general.loreal_dca.dmc_customer_historico` as h

where DATE(FORMAT_TIMESTAMP(%Y-%m-%d, CAST(h.creation_date as TIMESTAMP))) >= 2022-01-01 and DATE(FORMAT_TIMESTAMP(%Y-%m-%d, CAST(h.creation_date as TIMESTAMP))) <= 2023-07-30
  

==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================



select 
DISTINCT COUNT(t.Customer_ID) as QtdeClienteOrders,
         COUNT(c.Customer_ID) as QtdeClienteCustomers,
COUNT(t.pedidos) as QtdePedidos,
FORMAT_DATE(%B %Y, DATE_TRUNC(t.DataPedido, MONTH)) as Mes,
case when FORMAT_DATE(%B, t.DataPedido) = January = 1
              when FORMAT_DATE(%B,t.DataPedido) = February = 2
              when FORMAT_DATE(%B,t.DataPedido) = March = 3
              when FORMAT_DATE(%B,t.DataPedido) = April = 4
              when FORMAT_DATE(%B,t.DataPedido) = May = 5
              when FORMAT_DATE(%B,t.DataPedido) = June = 6
              when FORMAT_DATE(%B,t.DataPedido) = July = 7
              when FORMAT_DATE(%B,t.DataPedido) = August = 8
              when FORMAT_DATE(%B,t.DataPedido) = September = 9
              when FORMAT_DATE(%B,t.DataPedido) = October = 10
              when FORMAT_DATE(%B,t.DataPedido) = November = 11
              when FORMAT_DATE(%B,t.DataPedido) = December = 12
         end as mes_no,
         FORMAT_DATE(%Y, t.DataPedido) as ano

from `enext-general.loreal_dca.dmc_transaction_full` as t
left join `enext-general.loreal_dca.dmc_customer_full` as c
on c.Customer_ID = t.Customer_ID

#where Customer_ID = 3069254
#and DataPedido <= CURRENT_DATE()
#and DataPedido >= CURRENT_DATE()-180

group by 4,5,6

order by 6,5,4 desc
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================

select
COUNT(DISTINCT Customer_ID) as QtdeCliente,
datapedido
   

from `enext-general.loreal_dca.dmc_transactions_historico`
where Customer_ID = 3069254

group by 2

==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================

select 
DISTINCT COUNT(c.Customer_ID) as QtdeClienteCustomers,
FORMAT_DATE(%B %Y, DATE_TRUNC(c.creation_date, MONTH)) as Mes,
case when FORMAT_DATE(%B, c.creation_date) = January = 1
              when FORMAT_DATE(%B,c.creation_date) = February = 2
              when FORMAT_DATE(%B,c.creation_date) = March = 3
              when FORMAT_DATE(%B,c.creation_date) = April = 4
              when FORMAT_DATE(%B,c.creation_date) = May = 5
              when FORMAT_DATE(%B,c.creation_date) = June = 6
              when FORMAT_DATE(%B,c.creation_date) = July = 7
              when FORMAT_DATE(%B,c.creation_date) = August = 8
              when FORMAT_DATE(%B,c.creation_date) = September = 9
              when FORMAT_DATE(%B,c.creation_date) = October = 10
              when FORMAT_DATE(%B,c.creation_date) = November = 11
              when FORMAT_DATE(%B,c.creation_date) = December = 12
         end as mes_no,
         FORMAT_DATE(%Y, c.creation_date) as ano

from `enext-general.loreal_dca.dmc_customer_full` as c
#left join `enext-general.loreal_dca.dmc_customer_full` as c
#on c.Customer_ID = t.Customer_ID

where Customer_ID = 3069254
#and DataPedido <= CURRENT_DATE()
#and DataPedido >= CURRENT_DATE()-180

group by 2,3,4
order by 4,3,2 desc

==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================


select 
COUNT(DISTINCT t.Customer_ID) as QtdeClienteOrders,
#COUNT(DISTINCT c.Customer_ID) as QtdeClienteCustomers,
COUNT(t.pedidos) as QtdePedidos,
ROUND(SUM(t.order_net_price),2) as order_net_price,
ROUND(SUM(order_gross_price),2) as order_gross_price,
ROUND(SUM(Unit_Price),2) as Unit_Price,
ROUND(SUM(Unit_Discount),2) as Unit_Discount,
ROUND(SUM(Total_Discount),2) as Total_Discount,
SUM(t.Sold_Amount) as Sold_Amount,
FORMAT_DATE(%B %Y, DATE_TRUNC(t.DataPedido, MONTH)) as Mes,
case when FORMAT_DATE(%B, t.DataPedido) = January = 1
              when FORMAT_DATE(%B,t.DataPedido) = February = 2
              when FORMAT_DATE(%B,t.DataPedido) = March = 3
              when FORMAT_DATE(%B,t.DataPedido) = April = 4
              when FORMAT_DATE(%B,t.DataPedido) = May = 5
              when FORMAT_DATE(%B,t.DataPedido) = June = 6
              when FORMAT_DATE(%B,t.DataPedido) = July = 7
              when FORMAT_DATE(%B,t.DataPedido) = August = 8
              when FORMAT_DATE(%B,t.DataPedido) = September = 9
              when FORMAT_DATE(%B,t.DataPedido) = October = 10
              when FORMAT_DATE(%B,t.DataPedido) = November = 11
              when FORMAT_DATE(%B,t.DataPedido) = December = 12
         end as mes_no,
         FORMAT_DATE(%Y, t.DataPedido) as ano

from `enext-general.loreal_dca.dmc_transaction_full` as t
#left join `enext-general.loreal_dca.dmc_customer_full` as c
#on c.Customer_ID = t.Customer_ID

where DataPedido >= 2023-01-01
#where Customer_ID = 3069254
#and DataPedido <= CURRENT_DATE()
#and DataPedido >= CURRENT_DATE()-180

group by 9,10,11

order by 11,10,9 desc

==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
 Consulta - FREQUENCIA 12M
    Nome: Wagner F
    Atualizações: Todo dia às 11:00
    Data de criação: 07/08/2023
    Descrição: A frequencia de 12M e classificado pela quantidade de clientes.



SELECT
  COUNT(DISTINCT t.Customer_ID) AS QtdeClientes,
  COUNT(t.pedidos) as QtdePedidos,
  ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2) AS frequencia,
  
  CASE
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) = 1 = F1
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) > 1 AND (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) <= 2 = F2
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) > 2 AND (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) <= 3 = F3
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) > 3 AND (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) <= 4 = F4
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) > 4 = F5
    ELSE F5
  END AS FaixaFrequencia,
  DataPedido,
  FORMAT_DATE(%B %Y, DATE_TRUNC(t.DataPedido, MONTH)) AS Mes,
  CASE
    WHEN FORMAT_DATE(%B, t.DataPedido) = January = 1
    WHEN FORMAT_DATE(%B, t.DataPedido) = February = 2
    WHEN FORMAT_DATE(%B, t.DataPedido) = March = 3
    WHEN FORMAT_DATE(%B, t.DataPedido) = April = 4
    WHEN FORMAT_DATE(%B, t.DataPedido) = May = 5
    WHEN FORMAT_DATE(%B, t.DataPedido) = June = 6
    WHEN FORMAT_DATE(%B, t.DataPedido) = July = 7
    WHEN FORMAT_DATE(%B, t.DataPedido) = August = 8
    WHEN FORMAT_DATE(%B, t.DataPedido) = September = 9
    WHEN FORMAT_DATE(%B, t.DataPedido) = October = 10
    WHEN FORMAT_DATE(%B, t.DataPedido) = November = 11
    WHEN FORMAT_DATE(%B, t.DataPedido) = December = 12
  END AS mes_no,
  FORMAT_DATE(%Y, t.DataPedido) AS ano
FROM `enext-general.loreal_dca.dmc_transaction_full` AS t
WHERE DataPedido <= CURRENT_DATE()
  AND DataPedido >= CURRENT_DATE() - 365
GROUP BY 5,6,7
ORDER BY 7,6,5 DESC








SELECT
  c.customer_no,
  COUNT(DISTINCT t.pedidos) as QtdePedido,
  CASE
    WHEN COUNT(DISTINCT t.pedidos) = 1 = F1
    WHEN COUNT(DISTINCT t.pedidos) > 1 AND COUNT(DISTINCT t.pedidos) <= 2 = F2
    WHEN COUNT(DISTINCT t.pedidos) > 2 AND COUNT(DISTINCT t.pedidos) <= 3 = F3
    WHEN COUNT(DISTINCT t.pedidos) > 3 AND COUNT(DISTINCT t.pedidos) <= 4 = F4
    WHEN COUNT(DISTINCT t.pedidos) > 4 = F5
    ELSE F6
  END AS FaixaFrequencia, 
  #DataPedido,
  FORMAT_DATE(%B %Y, DATE_TRUNC(t.DataPedido, MONTH)) AS Mes,
  CASE
    WHEN FORMAT_DATE(%B, t.DataPedido) = January = 1
    WHEN FORMAT_DATE(%B, t.DataPedido) = February = 2
    WHEN FORMAT_DATE(%B, t.DataPedido) = March = 3
    WHEN FORMAT_DATE(%B, t.DataPedido) = April = 4
    WHEN FORMAT_DATE(%B, t.DataPedido) = May = 5
    WHEN FORMAT_DATE(%B, t.DataPedido) = June = 6
    WHEN FORMAT_DATE(%B, t.DataPedido) = July = 7
    WHEN FORMAT_DATE(%B, t.DataPedido) = August = 8
    WHEN FORMAT_DATE(%B, t.DataPedido) = September = 9
    WHEN FORMAT_DATE(%B, t.DataPedido) = October = 10
    WHEN FORMAT_DATE(%B, t.DataPedido) = November = 11
    WHEN FORMAT_DATE(%B, t.DataPedido) = December = 12
  END AS mes_no,
  FORMAT_DATE(%Y, t.DataPedido) AS ano

  from `enext-general.loreal_dca.dmc_transaction_full` as t
  inner join `enext-general.loreal_dca.dmc_customer_full` as c
  on c.Customer_ID = t.Customer_ID
  
  WHERE DataPedido <= CURRENT_DATE()
  AND DataPedido >= CURRENT_DATE() - 365
  #and customer_no = 70010370609

  group by 1,4,5,6










select 
FaixaFrequencia,
COUNT(DISTINCT customer_no) as QtdeClientes,
Mes,
mes_no

from `enext-general.loreal_dca.view_QtdePedidos`

#where customer_no = 70010370609

group by 1,3,4

order by 4,3,2 desc
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================

 Consulta - FREQUENCIA 180D
    Nome: Wagner F
    Atualizações: Todo dia às 11:00
    Data de criação: 07/08/2023
    Descrição: A frequencia de 180D


select 
ROUND((COUNT(t.pedidos)/COUNT(DISTINCT t.Customer_ID)),2) as frequencia,
DataPedido as dDate,
FORMAT_DATE(%B %Y, DATE_TRUNC(t.DataPedido, MONTH)) as Mes,
case when FORMAT_DATE(%B, t.DataPedido) = January = 1
              when FORMAT_DATE(%B,t.DataPedido) = February = 2
              when FORMAT_DATE(%B,t.DataPedido) = March = 3
              when FORMAT_DATE(%B,t.DataPedido) = April = 4
              when FORMAT_DATE(%B,t.DataPedido) = May = 5
              when FORMAT_DATE(%B,t.DataPedido) = June = 6
              when FORMAT_DATE(%B,t.DataPedido) = July = 7
              when FORMAT_DATE(%B,t.DataPedido) = August = 8
              when FORMAT_DATE(%B,t.DataPedido) = September = 9
              when FORMAT_DATE(%B,t.DataPedido) = October = 10
              when FORMAT_DATE(%B,t.DataPedido) = November = 11
              when FORMAT_DATE(%B,t.DataPedido) = December = 12
         end as mes_no,
         FORMAT_DATE(%Y, t.DataPedido) as ano

from `enext-general.loreal_dca.dmc_transaction_full` as t

where DataPedido >= 2023-01-01
and DataPedido <= CURRENT_DATE()
and DataPedido >= CURRENT_DATE()-180

group by 2,3,4

order by 4,3,2 desc








==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================





CASE 
WHEN REGEXP_CONTAINS(Mês, Janeiro) = 1
WHEN REGEXP_CONTAINS(Mês, Fevereiro) = 2
WHEN REGEXP_CONTAINS(Mês, Março) = 3
WHEN REGEXP_CONTAINS(Mês, Abril) = 4
WHEN REGEXP_CONTAINS(Mês, Maio) = 5
WHEN REGEXP_CONTAINS(Mês, Junho) = 6
WHEN REGEXP_CONTAINS(Mês, Julho) = 7
WHEN REGEXP_CONTAINS(Mês, Agosto) = 8
WHEN REGEXP_CONTAINS(Mês, Setembro) = 9
WHEN REGEXP_CONTAINS(Mês, Outubro) = 10
WHEN REGEXP_CONTAINS(Mês, Novembro) = 11
WHEN REGEXP_CONTAINS(Mês, Dezembro) = 12
END








==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================

SELECT

DATE_TRUNC(CURRENT_DATE(), MONTH) as M1,
DATE_ADD(DATE_TRUNC(CURRENT_DATE, MONTH), INTERVAL 1 MONTH) as M2,
DATE_SUB(DATE_ADD(DATE_TRUNC(CURRENT_DATE, MONTH), INTERVAL 1 MONTH), INTERVAL 1 DAY) as M3,
EXTRACT(DAY FROM DATE_SUB(DATE_ADD(DATE_TRUNC(CURRENT_DATE, MONTH), INTERVAL 1 MONTH), INTERVAL 1 DAY)) AS M4,

LPAD(CAST(EXTRACT(DAY FROM CAST(DATETIME_TRUNC(CURRENT_DATE(), MONTH) AS DATE)) AS STRING), 2, 0) as dia,
DATE_TRUNC(CURRENT_DATE(), MONTH) - 365 as data,
DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL - 1 MONTH) as datamesAnterior,
DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 DAY) as ultimoDiaMesAnterior,
DATE_SUB(DATE_TRUNC(CURRENT_DATE, MONTH), INTERVAL 1 DAY) AS ultimo_dia_do_mes_corrente,







select DISTINCT pedidos as total, DataPedido from `enext-general.loreal_dca.dmc_transaction_full` as t
inner join `enext-general.loreal_dca.dmc_customer_full` as c
on c.Customer_ID = t.Customer_ID
where c.customer_no = 32896395091
and DataPedido < DATE_TRUNC(CURRENT_DATE(), MONTH)
  AND DataPedido >= DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL - 1 MONTH) - 365




  select 
QtdePedido,
COUNT(DISTINCT customer_no) as QtdeClientes

from `enext-general.loreal_dca.view_dmc_freq_original`

#where customer_no = 70010370609

group by 1

#order by 4,3,2 desc









==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
Tabela fato dimensão estruturada


select 
f.send_date,
f.sends,
f.deliveries,
f.uniqueOpens,
dimensaoCamp.emailname,
dimensaoCamp.subject

from `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as f

inner join
(
select
distinct emailname,
subject

       from
       (SELECT 
              distinct emailname,
              send_date,
              subject,
              previewurl,
              rede,
              marca,
              categoria,
              tema,
              exclusividade,
              segmentacao,
              tipo,
              MAX(send_date)
              OVER (PARTITION BY emailname) AS max_data
              FROM `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` )
where send_date = max_data) as dimensaoCamp on dimensaoCamp.emailname = f.emailname

where f.emailname like AEO9%







select * from
(
SELECT DISTINCT(UPPER(f.emailname)) AS campaign,
        "SalesForce" as Fonte
       FROM `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as f

UNION ALL

SELECT DISTINCT(UPPER(ga.ga_campaign)) AS campaign,
         "GA" as Fonte
FROM `enext-datarepository.loreal_dca.dmc_ga_campaign_full`as ga
WHERE LOWER(ga.ga_campaign) NOT IN (SELECT DISTINCT(LOWER(f2.emailname)) AS campaign
                                     FROM `enext-datarepository.loreal_dca.dmc_sfmc_sends_full` as f2))

where campaign like AEO9%








==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================




select
    SUM(novo.ga_sessions) as ga_sessions,
    SUM(novo.ga_transactions) as ga_transactions,
    SUM(novo.ga_transactionrevenue) as ga_transactionrevenue,
    SUM(novo.ga_itemquantity) as ga_itemquantity,
 
case when TRIM(novo.ga_campaign) = TRANSACTIONALS_ORDERNOTIFICATION_REDEMPTION_ACD_LTY_TRANS_Redemption = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-reg 
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_ORDERNOTIFICATION_ACD_LTY_TRANS_Purchase = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_ORDERNOTIFICATION_ITEM_RETRIEVED_ACD_LTY_TRANS_RetrievedItems = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_DOUBLE_OPTIN_ACD_LTY_TRANS_Opt_in_ConfirmEmail = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_MGM_NOTIFIED_ACD_LTY_TRANS_MGM_Recommended_Notified = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_MGM_PURCHASEMADE_ACD_LTY_TRANS_MGM_Purchase_Made = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_OPTOUT_ACD_LTY_TRANS_OptOut = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_WELCOME_ACD_LTY_TRANS_Welcome = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_RESET_MY_PASSWORD_ACD_LTY_TRANS_Reset-PAcesso = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_POINTS_EXPIRATION_NOBALANCE_ACD_LTY_TRANS_PointsExpirationNOBalance = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_POINTS_EXPIRATION_ACD_LTY_TRANS_PointsExpiration = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-reg
     when TRIM(novo.ga_campaign) = TRANSACTIONALS_MGM_RECEIVED_ACD_LTY_TRANS_MGM_Received = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-reg
     when TRIM(novo.ga_campaign) = 462399_SEM_UTM = ACP7_DMC_BRA_pesquisa-dercos-seg_1_2023
     when TRIM(novo.ga_campaign) = der_othr_comprecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-rep-reg = der_othr_comprecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-reg 
     when TRIM(novo.ga_campaign) = der_othr_compunico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-rep-reg = der_othr_compunico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-reg 
     when TRIM(novo.ga_campaign) = der_othr_engsemcompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engsemcompra-step1-rep-reg = der_othr_engsemcompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engsemcompra-step1-reg 
     when TRIM(novo.ga_campaign) = der_othr_navnaocomp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-reg = der_othr_navnaocomp_xxxxxx-br-acd-b2c-der-procedure-rreplenishment-customers-nav-nao-comp-reg 
     when TRIM(novo.ga_campaign) = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-rep-reg = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-reg
     WHEN TRIM(novo.ga_campaign) = AEP7_DMC_BRA_ATT-PV-MM-MC-05-N-127-SEG_1_2023 = AEP7_DMC_BRA_ATT-PV-MM-MC-05-N-103-SEG_1_2023
     WHEN TRIM(novo.ga_campaign) = AEP5_DMC_BRA_ATT-VN-MM-MC-05-N-103-SEG_1_2023 = AEP5_DMC_BRA_ATT-VN-MM-MC-05-N-104-SEG_1_2023
     WHEN TRIM(novo.ga_campaign) = AEP6_DMC_BRA_ATT-SP-MM-MC-05-N-104-SEG_1_2023 = AEP6_DMC_BRA_ATT-SP-MM-MC-05-N-127-SEG_1_2023
     else TRIM(novo.ga_campaign) end as ga_campaign,
     dermaclub.com.br as base,
    novo.ga_sourcemedium as ga_sourcemedium,
    CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) as ga_date,
    novo.ga_channelgrouping as ga_channelgrouping,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 2 and TRIM(novo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(1)], r[^_]+) ELSE NULL END as rede,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 3 and TRIM(novo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(2)], r[^_]+) ELSE NULL END as marca,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 4 and TRIM(novo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(3)], r[^_]+) ELSE NULL END as categoria,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 5 and TRIM(novo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(4)], r[^_]+) ELSE NULL END as tema,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 6 and TRIM(novo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(5)], r[^_]+) ELSE NULL END as exclusividade,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 7 and TRIM(novo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(6)], r[^_]+) ELSE NULL END as segmentacao,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(novo.ga_campaign), -)) >= 8 and TRIM(novo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(novo.ga_campaign),-)[OFFSET(7)], r[^_]+) ELSE NULL END as tipo
from
    `enext-datarepository.loreal_dca.dmc_ga_campaigns_novo` as novo
where
    CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= 2023-04-26

group by 
    novo.ga_sessions,
    novo.ga_transactions,
    novo.ga_transactionrevenue,
    novo.ga_itemquantity,
    novo.ga_campaign,
    novo.ga_sourcemedium,
    novo.ga_date,
    novo.ga_channelgrouping,
    rede,
    marca,
    categoria,
    tema,
    exclusividade,
    segmentacao,
    tipo

    UNION ALL

    select

    SUM(antigo.ga_sessions) as ga_sessions,
    SUM(antigo.ga_transactions) as ga_transactions,
    SUM(antigo.ga_transactionrevenue) as ga_transactionrevenue,
    SUM(antigo.ga_itemquantity) as ga_itemquantity,
    case when TRIM(antigo.ga_campaign) = TRANSACTIONALS_ORDERNOTIFICATION_REDEMPTION_ACD_LTY_TRANS_Redemption = der_othr_redemptionLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRedemption-reg 
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_ORDERNOTIFICATION_ACD_LTY_TRANS_Purchase = der_othr_orderNotificationLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotification-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_ORDERNOTIFICATION_ITEM_RETRIEVED_ACD_LTY_TRANS_RetrievedItems = der_othr_retrievedItemsLTY_xxxxxx-br-dpp-b2c-der-transactionals-orderNotificationRetrievedItems-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_DOUBLE_OPTIN_ACD_LTY_TRANS_Opt_in_ConfirmEmail = der_othr_optinConfirmEmailLTY_xxxxxx-br-dpp-b2c-der-transactionals-doubleOptinConfirmEmailL-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_MGM_NOTIFIED_ACD_LTY_TRANS_MGM_Recommended_Notified = der_othr_mgmRecommendedNotifiedLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmRecommendedNotified-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_MGM_PURCHASEMADE_ACD_LTY_TRANS_MGM_Purchase_Made = der_othr_mgmPurchaseMadeLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmPurchaseMade-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_OPTOUT_ACD_LTY_TRANS_OptOut = der_othr_optoutLTY_xxxxxx-br-dpp-b2c-der-transactionals-optout-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_WELCOME_ACD_LTY_TRANS_Welcome = der_othr_welcomeLTY_xxxxxx-br-dpp-b2c-der-transactionals-Welcome-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_RESET_MY_PASSWORD_ACD_LTY_TRANS_Reset-PAcesso = der_othr_resetMyPasswordLTY_xxxxxx-br-dpp-b2c-der-transactionals-resetPAcesso-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_POINTS_EXPIRATION_NOBALANCE_ACD_LTY_TRANS_PointsExpirationNOBalance = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-PointsExpirationNOBalance-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_POINTS_EXPIRATION_ACD_LTY_TRANS_PointsExpiration = der_othr_pointsExpirationLTY_xxxxxx-br-dpp-b2c-der-transactionals-pointsExpiration-reg
         when TRIM(antigo.ga_campaign) = TRANSACTIONALS_MGM_RECEIVED_ACD_LTY_TRANS_MGM_Received = der_othr_mgmLTY_xxxxxx-br-dpp-b2c-der-transactionals-mgmReceived-reg
         when TRIM(antigo.ga_campaign) = 462399_SEM_UTM = ACP7_DMC_BRA_pesquisa-dercos-seg_1_2023
         when TRIM(antigo.ga_campaign) = der_othr_comprecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-rep-reg = der_othr_comprecorrentes_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-recorrentes-reg 
         when TRIM(antigo.ga_campaign) = der_othr_compunico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-rep-reg = der_othr_compunico_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-comp-unico-5-percent-reg 
         when TRIM(antigo.ga_campaign) = der_othr_engsemcompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engsemcompra-step1-rep-reg = der_othr_engsemcompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-engsemcompra-step1-reg 
         when TRIM(antigo.ga_campaign) = der_othr_navnaocomp_xxxxxx-br-acd-b2c-der-procedure-replenishment-customers-nav-nao-comp-reg = der_othr_navnaocomp_xxxxxx-br-acd-b2c-der-procedure-rreplenishment-customers-nav-nao-comp-reg 
         when TRIM(antigo.ga_campaign) = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-rep-reg = der_othr_produtosrecompra_xxxxxx-br-acd-b2c-der-lifecycle-retained-customers-recompra-step2-reg
         WHEN TRIM(antigo.ga_campaign) = AEP7_DMC_BRA_ATT-PV-MM-MC-05-N-127-SEG_1_2023 = AEP7_DMC_BRA_ATT-PV-MM-MC-05-N-103-SEG_1_2023
         WHEN TRIM(antigo.ga_campaign) = AEP5_DMC_BRA_ATT-VN-MM-MC-05-N-103-SEG_1_2023 = AEP5_DMC_BRA_ATT-VN-MM-MC-05-N-104-SEG_1_2023
         WHEN TRIM(antigo.ga_campaign) = AEP6_DMC_BRA_ATT-SP-MM-MC-05-N-104-SEG_1_2023 = AEP6_DMC_BRA_ATT-SP-MM-MC-05-N-127-SEG_1_2023
         else TRIM(antigo.ga_campaign) end as ga_campaign,
    loja.dermaclub.com.br as base,
    antigo.ga_sourcemedium as ga_sourcemedium,
    CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) as ga_date,
    antigo.ga_channelgrouping as ga_channelgrouping,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 2 and TRIM(antigo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(1)], r[^_]+) ELSE NULL END as rede,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 3 and TRIM(antigo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(2)], r[^_]+) ELSE NULL END as marca,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 4 and TRIM(antigo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(3)], r[^_]+) ELSE NULL END as categoria,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 5 and TRIM(antigo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(4)], r[^_]+) ELSE NULL END as tema,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 6 and TRIM(antigo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(5)], r[^_]+) ELSE NULL END as exclusividade,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 7 and TRIM(antigo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(6)], r[^_]+) ELSE NULL END as segmentacao,
    CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(antigo.ga_campaign), -)) >= 8 and TRIM(antigo.ga_campaign) like A% and CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) >= 2023-05-01 = REGEXP_EXTRACT(SPLIT(TRIM(antigo.ga_campaign),-)[OFFSET(7)], r[^_]+) ELSE NULL END as tipo
from
    `enext-datarepository.loreal_dca.dmc_ga_campaigns_antigo` as antigo
where
    CAST(PARSE_DATE("%Y%m%d", antigo.ga_date) as DATE) <= 2023-04-25

group by
    antigo.ga_campaign,
    antigo.ga_sourcemedium,
    antigo.ga_date,
    antigo.ga_channelgrouping,
    rede,
    marca,
    categoria,
    tema,
    exclusividade,
    segmentacao,
    tipo







#left join `enext-datarepository.loreal_dca.dmc_regrasDeNegocio` as regraDeNegocio 
#on regraDeNegocio.Aux = CONCAT(g.ga_campaign,g.ga_sourcemedium,g.ga_channelgrouping)

#regraDeNegocio.Canal as canalPersonalizado,
#regraDeNegocio.Subcanal as subCanalPersonalizado,


#left join `enext-datarepository.loreal_dca.dmc_regrasDeNegocio` as regraDeNegocio 
#on regraDeNegocio.Aux = CONCAT(sendsfull.emailname,"crm / email","Email")

==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================


    SELECT
  /*FORMAT_DATE(%Y, CURRENT_DATE()) AS ano,
  FORMAT_DATE(%B %Y, DATE_TRUNC(CURRENT_DATE(), MONTH)) AS Mes,
  CASE
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = January = 1
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = February = 2
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = March = 3
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = April = 4
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = May = 5
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = June = 6
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = July = 7
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = August = 8
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = September = 9
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = October = 10
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = November = 11
    WHEN FORMAT_DATE(%B, CURRENT_DATE()) = December = 12
  END AS mes_no,
  CURRENT_DATE() as dDate,*/
  t.Customer_ID,
  COUNT(DISTINCT t.pedidos) as QtdePedido,
  CASE
    WHEN COUNT(DISTINCT t.pedidos) = 1 = Frequência = 1
    WHEN COUNT(DISTINCT t.pedidos) > 1 AND COUNT(DISTINCT t.pedidos) <= 2 = Frequencia > 1 e <= 2
    WHEN COUNT(DISTINCT t.pedidos) > 2 AND COUNT(DISTINCT t.pedidos) <= 3 = Frequencia > 2 e <= 3
    WHEN COUNT(DISTINCT t.pedidos) > 3 AND COUNT(DISTINCT t.pedidos) <= 4 = Frequencia > 3 e <= 4
    WHEN COUNT(DISTINCT t.pedidos) > 4 AND COUNT(DISTINCT t.pedidos) <= 10 = Frequencia > 4 e < 10 
    ELSE Freq > 10
  END AS FaixaFrequencia
  
  from `enext-general.loreal_dca.dmc_transaction_full` as t
  #inner join `enext-general.loreal_dca.dmc_customer_full` as c
  #on c.Customer_ID = t.Customer_ID
  
  WHERE t.DataPedido < DATE_TRUNC(CURRENT_DATE(), MONTH)
  AND t.DataPedido >= DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL - 1 MONTH) - 365 
 # and customer_no = 32896395091

  group by 1









select 
FORMAT_DATE(%B %Y, DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 DAY)) as mesReferencia,
x.FaixaFrequencia,
COUNT(DISTINCT x.Customer_ID) as QtdeClientes

from (
  SELECT
  t.Customer_ID,
  COUNT(DISTINCT t.pedidos) as QtdePedido,
  CASE
    WHEN COUNT(DISTINCT t.pedidos) = 1 = Frequência = 1
    WHEN COUNT(DISTINCT t.pedidos) > 1 AND COUNT(DISTINCT t.pedidos) <= 2 = Frequencia > 1 e <= 2
    WHEN COUNT(DISTINCT t.pedidos) > 2 AND COUNT(DISTINCT t.pedidos) <= 3 = Frequencia > 2 e <= 3
    WHEN COUNT(DISTINCT t.pedidos) > 3 AND COUNT(DISTINCT t.pedidos) <= 4 = Frequencia > 3 e <= 4
    WHEN COUNT(DISTINCT t.pedidos) > 4 AND COUNT(DISTINCT t.pedidos) <= 10 = Frequencia > 4 e < 10 
    ELSE Freq > 10
  END AS FaixaFrequencia
  
  from `enext-general.loreal_dca.dmc_transaction_full` as t
  
  
  WHERE t.DataPedido < DATE_TRUNC(CURRENT_DATE(), MONTH)
  AND t.DataPedido >= DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL - 1 MONTH) - 365 
  group by 1

) as x

group by 1,2





==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================






SELECT
  COUNT(DISTINCT t.Customer_ID) AS QtdeClientes,
  COUNT(t.pedidos) as QtdePedidos,
  ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2) AS frequencia,
  
  CASE
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) = 1 = F1
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) > 1 AND (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) <= 2 = F2
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) > 2 AND (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) <= 3 = F3
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) > 3 AND (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) <= 4 = F4
    WHEN (ROUND((COUNT(t.pedidos) / COUNT(DISTINCT t.Customer_ID)), 2)) > 4 = F5
    ELSE F5
  END AS FaixaFrequencia,
  DataPedido,
  FORMAT_DATE(%B %Y, DATE_TRUNC(t.DataPedido, MONTH)) AS Mes,
  CASE
    WHEN FORMAT_DATE(%B, t.DataPedido) = January = 1
    WHEN FORMAT_DATE(%B, t.DataPedido) = February = 2
    WHEN FORMAT_DATE(%B, t.DataPedido) = March = 3
    WHEN FORMAT_DATE(%B, t.DataPedido) = April = 4
    WHEN FORMAT_DATE(%B, t.DataPedido) = May = 5
    WHEN FORMAT_DATE(%B, t.DataPedido) = June = 6
    WHEN FORMAT_DATE(%B, t.DataPedido) = July = 7
    WHEN FORMAT_DATE(%B, t.DataPedido) = August = 8
    WHEN FORMAT_DATE(%B, t.DataPedido) = September = 9
    WHEN FORMAT_DATE(%B, t.DataPedido) = October = 10
    WHEN FORMAT_DATE(%B, t.DataPedido) = November = 11
    WHEN FORMAT_DATE(%B, t.DataPedido) = December = 12
  END AS mes_no,
  FORMAT_DATE(%Y, t.DataPedido) AS ano
FROM `enext-general.loreal_dca.dmc_transaction_full` AS t
WHERE DataPedido <= CURRENT_DATE()
  AND DataPedido >= CURRENT_DATE() - 365
GROUP BY 5,6,7
ORDER BY 7,6,5 DESC



==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================








SELECT
    x.QtdePedido,
    COUNT(DISTINCT x.Customer_ID) as qtdeCliente,
    SUM(x.QtdePedido)/COUNT(DISTINCT x.Customer_ID) as freq,
    #x.DataPedido,
    x.Mes,
    x.mes_no,
    x.ano
          from (
            SELECT
            t.Customer_ID,
            COUNT(DISTINCT t.pedidos) as QtdePedido,
            t.DataPedido,
            FORMAT_DATE(%B %Y, DATE_TRUNC(t.DataPedido, MONTH)) AS Mes,
            CASE
              WHEN FORMAT_DATE(%B, t.DataPedido) = January = 1
              WHEN FORMAT_DATE(%B, t.DataPedido) = February = 2
              WHEN FORMAT_DATE(%B, t.DataPedido) = March = 3
              WHEN FORMAT_DATE(%B, t.DataPedido) = April = 4
              WHEN FORMAT_DATE(%B, t.DataPedido) = May = 5
              WHEN FORMAT_DATE(%B, t.DataPedido) = June = 6
              WHEN FORMAT_DATE(%B, t.DataPedido) = July = 7
              WHEN FORMAT_DATE(%B, t.DataPedido) = August = 8
              WHEN FORMAT_DATE(%B, t.DataPedido) = September = 9
              WHEN FORMAT_DATE(%B, t.DataPedido) = October = 10
              WHEN FORMAT_DATE(%B, t.DataPedido) = November = 11
              WHEN FORMAT_DATE(%B, t.DataPedido) = December = 12
            END AS mes_no,
            FORMAT_DATE(%Y, t.DataPedido) AS ano
            
            from `enext-general.loreal_dca.dmc_transaction_full` as t
            
            
            WHERE t.DataPedido <= CURRENT_DATE()
            AND t.DataPedido >= CURRENT_DATE() - 180
            group by 1,3,4,5,6

          ) as x

                          group by 1,4,5,6
                          limit 2


  ==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================
==========================================================================================================================================================================================================

Fórmula de convesão de data de string para Data dentro do Looker Studio:

CAST(DATETIME_TRUNC(PARSE_DATE(%B %Y, campo_string),MONTH) as DATE)





CASE
   when REGEXP_CONTAINS(mes_ano,Janeiro) = CONCAT(01/01/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Fevereiro) =  CONCAT(01/02/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Marco) =  CONCAT(01/03/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Abril) =  CONCAT(01/04/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Maio) =  CONCAT(01/05/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Junho) =  CONCAT(01/06/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Julho) =  CONCAT(01/07/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Agosto) =  CONCAT(01/08/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Setembro) =  CONCAT(01/09/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Outubro) =  CONCAT(01/10/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Novembro) =  CONCAT(01/11/,RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,Dezembro) =  CONCAT(01/12/,RIGHT_TEXT(mes_ano,4))
END


CASE
   when REGEXP_CONTAINS(mes,January) = CONCAT(01/01/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,February) =  CONCAT(01/02/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,March) =  CONCAT(01/03/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,April) =  CONCAT(01/04/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,May) =  CONCAT(01/05/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,June) =  CONCAT(01/06/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,July) =  CONCAT(01/07/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,August) =  CONCAT(01/08/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,September) =  CONCAT(01/09/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,October) =  CONCAT(01/10/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,November) =  CONCAT(01/11/,RIGHT_TEXT(mes,4))
   when REGEXP_CONTAINS(mes,December) =  CONCAT(01/12/,RIGHT_TEXT(mes,4))
END
      

Mês-Ano (Texto) = CONCAT(MONTH(dDate), "-", YEAR(dDate))

Mês-Ano(Data) = PARSE_DATE(%m-%Y, Mês-Ano (Texto))

PARSE_DATE(%d/%m/%Y, Mês-Texto)
PARSE_DATE(%d/%m/%Y, Data (Texto))






CASE
WHEN REGEXP_MATCH(mes, January 2021) = 01/01/2021
WHEN REGEXP_MATCH(mes, February 2021) = 01/02/2021
WHEN REGEXP_MATCH(mes, March 2021) = 01/03/2021
WHEN REGEXP_MATCH(mes, April 2021) = 01/04/2021
WHEN REGEXP_MATCH(mes, May 2021) = 01/05/2021
WHEN REGEXP_MATCH(mes, June 2021) = 01/06/2021
WHEN REGEXP_MATCH(mes, July 2021) = 01/07/2021
WHEN REGEXP_MATCH(mes, August 2021) = 01/08/2021
WHEN REGEXP_MATCH(mes, September 2021) = 01/09/2021
WHEN REGEXP_MATCH(mes, October 2021) = 01/10/2021
WHEN REGEXP_MATCH(mes, November 2021) = 01/11/2021
WHEN REGEXP_MATCH(mes, December 2021) = 01/12/2021
WHEN REGEXP_MATCH(mes, January 2022) = 01/01/2022
WHEN REGEXP_MATCH(mes, February 2022) = 01/02/2022
WHEN REGEXP_MATCH(mes, March 2022) = 01/03/2022
WHEN REGEXP_MATCH(mes, April 2022) = 01/04/2022
WHEN REGEXP_MATCH(mes, May 2022) = 01/05/2022
WHEN REGEXP_MATCH(mes, June 2022) = 01/06/2022
WHEN REGEXP_MATCH(mes, July 2022) = 01/07/2022
WHEN REGEXP_MATCH(mes, August 2022) = 01/08/2022
WHEN REGEXP_MATCH(mes, September 2022) = 01/09/2022
WHEN REGEXP_MATCH(mes, October 2022) = 01/10/2022
WHEN REGEXP_MATCH(mes, November 2022) = 01/11/2022
WHEN REGEXP_MATCH(mes, December 2022) = 01/12/2022
WHEN REGEXP_MATCH(mes, January 2023) = 01/01/2023
WHEN REGEXP_MATCH(mes, February 2023) = 01/02/2023
WHEN REGEXP_MATCH(mes, March 2023) = 01/03/2023
WHEN REGEXP_MATCH(mes, April 2023) = 01/04/2023
WHEN REGEXP_MATCH(mes, May 2023) = 01/05/2023
WHEN REGEXP_MATCH(mes, June 2023) = 01/06/2023
WHEN REGEXP_MATCH(mes, July 2023) = 01/07/2023
WHEN REGEXP_MATCH(mes, August 2023) = 01/08/2023
WHEN REGEXP_MATCH(mes, September 2023) = 01/09/2023
WHEN REGEXP_MATCH(mes, October 2022) = 01/10/2023
WHEN REGEXP_MATCH(mes, November 2022) = 01/11/2023


 ELSE Janeiro 2020
      END 








https://clube.dermaclub.com.br/email-marketing/2X1T1L?utm_source=crm&utm_campaign=AFB5_DMC_BRA_D2C-DM-MM-MC-05-E-129-SEG_1_2023&utm_eid=808521a000fd8ac6cd9c3992a16dbd4917037ffbbe2051a51580022e199e7854&utm_sid=230346589&utm_medium=email




CRM: Email, SMS, Whats
Mídia Paga: CPC, Referral, Paid
SEO: Organic
Social Media: Social





create table enext-general.loreal_dca.dmc_optdwon_fato as
select 
    distinct cast(customer_id as string) as customer_id,
    email,
      case when down.gender = f = Feminino
        when down.gender = m = Masculino
        when down.gender = b = Não-Binário
        when down.gender = n = Não importa
       else Não informado 
     end as gender,
    UPPER(CONCAT(first_name," ",last_name)) as fullname,
    dataoptdown
    from enext-general.loreal_dca.dmc_optdwon_full as down
    where 1 = 0;





    insert into `enext-general.loreal_dca.dmc_optdown_fato`(email, gender, customer_id, fullname, dataoptdown)
select 
down.email,
case when down.gender = f = Feminino
     when down.gender = m = Masculino
     when down.gender = b = Não-Binário
     when down.gender = n = Não importa
     else Não informado 
end as gender,
cast(down.customer_id as int64) as customer_id,
UPPER(CONCAT(first_name," ",last_name)) as fullname,
DATE(down.dataoptdown) as dataoptdown

from enext-general.loreal_dca.dmc_optdwon_full as down

where down.email not in (select email from `enext-general.loreal_dca.dmc_optdown_fato`)





-> Retation Rate ->

Compradores do Mês - Compradores antigos


Entregas desde do começo do ano! e o que evoluimos









Filtros canais e um filtro Geral de CRM


MTD meta -> Diária 


Sessions do que aconteceu * Qtde de dias que faltam do mês


Atingimento Projetado




Meta de Conversões
Meta de Outros 
Meta de CRM




Ano = YEAR(dDate)
Mês = MONTH(dDate)
Mês-Ano (Texto) = CONCAT(MONTH(dDate), "-", YEAR(dDate))
Mês-Ano (Data) = PARSE_DATE('%m-%Y', Mês-Ano (Texto))




Tabela trazer canais um do lado do outro 






% atingmento do dia -> Projeção da Métrica 

Receita, conversão e sessão

Projeção

Gerencial > Canal, Geral, Acompanhamentos


















Mês = MONTH(dDate)

Ultimo dia do mês
CASE
    WHEN CAST(Mês as TEXT) = "1" then 31
    WHEN CAST(Mês as TEXT) = "2" then 28
    WHEN CAST(Mês as TEXT) = "3" then 31
    WHEN CAST(Mês as TEXT) = "4" then 30
    WHEN CAST(Mês as TEXT) = "5" then 31
    WHEN CAST(Mês as TEXT) = "6" then 30
    WHEN CAST(Mês as TEXT) = "7" then 31
    WHEN CAST(Mês as TEXT) = "8" then 31
    WHEN CAST(Mês as TEXT) = "9" then 30
    WHEN CAST(Mês as TEXT) = "10" then 31
    WHEN CAST(Mês as TEXT) = "11" then 30
    ELSE 32
END
    

AVG receita
SUM(receita) / COUNT_DISTINCT(DAY(dDate))

Projeção Receita
AVG Receita * LAST(Ultimo dia do mês)



AVG Receita = 214.434 / 24 (12.892,37)
12.892,37 * 31


317.994 / 24




658.322

181.514,98
158.812,55
214.433,88


unsubscribes/cliques - Semana passada 4,79% - 4,47%

/**
 * Segmentação de dermaclub
 * 
  case when lower(g.rede) = 'pv' then 'PANVEL' 
       when lower(g.rede) = 'sp' then 'DPSP'
       when lower(g.rede) = 'pt' then 'FARMACIA PERMANENTE'
       when lower(g.rede) = 'rd' then 'RAIA DROGASIL S/A.'
       when lower(g.rede) = 'cl' then 'CLAMED FARMACIAS'
       when lower(g.rede) = 'tm' then 'DROGARIA TAMOIO'
       when lower(g.rede) = 'pm' then 'DROG.PAGUE MENOS'
       when lower(g.rede) = 'ns' then 'FARMACIA E DROGARIA NISSEI S.A'
       when lower(g.rede) = 'in' then 'FARMACIA INDIANA'
       when lower(g.rede) = 'sj' then 'FARMACIAS SÃO JOÃO'
       when lower(g.rede) = 'sk' then 'E-BOUTIQUE SKC'
       when lower(g.rede) = 'aj' then 'DROGRARIA ARAUJO'
       when lower(g.rede) = 'vn' then 'GRUPO VENANCIO'
       when lower(g.rede) = 'ml' then 'D1000'
       when lower(g.rede) = 'ek' then 'EPOCA COSMETICOS'
       when lower(g.rede) = 'ft' then 'DROGAL FARMACEUTICA'
       when lower(g.rede) = 'rs' then 'DROGARIA ROSARIO'
       when lower(g.rede) = 'ex' then 'EXTRAFARMA'
       when lower(g.rede) = 'dm' or lower(g.rede) = 'dc' then 'D2C DERMACLUB' else 'Não Parametrizado' end as rede,
    
  case when lower(g.marca) = 'cr' then 'CeraVe'
       when lower(g.marca) = 'lr' then 'La Roche-Posay'
       when lower(g.marca) = 'mm' then 'Multimarcas'
       when lower(g.marca) = 'sc' then 'SkinCeuticals'
       when lower(g.marca) = 'vy' then 'Vichy'
       when lower(g.marca) = 'dc' then 'DMC' else 'Não Parametrizado' end as marca,

  case when lower(g.categoria) = 'ai' then 'Anti Idade'
       when lower(g.categoria) = 'ar' then 'Antirrugas'
       when lower(g.categoria) = 'cp' then 'Capilar'
       when lower(g.categoria) = 'hd' then 'Hidratação'
       when lower(g.categoria) = 'lp' then 'Limpeza'
       when lower(g.categoria) = 'mc' then 'Multicategoria'
       when lower(g.categoria) = 'sl' then 'Solar'
       when lower(g.categoria) = 'am' then 'Antimanchas'
       when lower(g.categoria) = 'aa' then 'Antiacne'
       when lower(g.categoria) = 'vc' then 'Vitamina C'
       when lower(g.categoria) = 'pq' then 'Pesquisa' else 'Não Parametrizado' end as categoria,

  case when lower(g.tema) = '00' then 'Dia D'
       when lower(g.tema) = '01' then 'Dermadrugada'
       when lower(g.tema) = '02' then 'Alerta Promo'
       when lower(g.tema) = '03' then 'Comprou Ganhou'
       when lower(g.tema) = '04' then 'Conteúdo'
       when lower(g.tema) = '05' then 'Desconto'
       when lower(g.tema) = '06' then 'Pontuação'
       when lower(g.tema) = '07' then 'Progressiva'
       when lower(g.tema) = '08' then 'Lançamento'
       when lower(g.tema) = '09' then 'Frete Grátis'
       when lower(g.tema) = '10' then 'Pesquisa'
       when lower(g.tema) = '11' then 'Promo Mês'
       when lower(g.tema) = '12' then 'Promo Semana '
       when lower(g.tema) = '13' then 'Kits'
       when lower(g.tema) = '14' then 'Comunicado'
       when lower(g.tema) = '15' then 'Dia do Consumidor'
       when lower(g.tema) = '16' then 'Rebaixa Trade'
       when lower(g.tema) = '17' then 'Calendário 360'
       when lower(g.tema) = '18' then 'Dia das Mulheres'
       when lower(g.tema) = '19' then 'Festival' 
       when lower(g.tema) = '20' then 'LMPM' 
       else 'Não Parametrizado' end as tema,

  case when lower(g.exclusividade) = 'e' then 'Exclusivo'
       when lower(g.exclusividade) = 'n' then 'Não Exclusivo' else 'Não Parametrizado' end as exclusividade,

  case when lower(g.segmentacao) = '000' then 'Engajados 90D'
       when lower(g.segmentacao) = '001' then 'Engajados 180D'
       when lower(g.segmentacao) = '002' then 'Engajados 360D'
       when lower(g.segmentacao) = '003' then 'Carrinho Abandonado'
       when lower(g.segmentacao) = '004' then 'Compradores Categoria'
       when lower(g.segmentacao) = '005' then 'Compradores do Produto'
       when lower(g.segmentacao) = '006' then 'Compradores Marca'
       when lower(g.segmentacao) = '007' then 'Compradores Únicos'
       when lower(g.segmentacao) = '008' then 'Cross Sell'
       when lower(g.segmentacao) = '009' then 'Faixa Etária 45+'
       when lower(g.segmentacao) = '010' then 'Não Compradores'
       when lower(g.segmentacao) = '011' then 'Navegou e Não Comprou'
       when lower(g.segmentacao) = '012' then 'Inativos'
       when lower(g.segmentacao) = '013' then 'White'
       when lower(g.segmentacao) = '014' then 'Ticket Médio Baixo '
       when lower(g.segmentacao) = '015' then 'Baixo Potencial'
       when lower(g.segmentacao) = '016' then 'Potencial Frequência'
       when lower(g.segmentacao) = '017' then 'Potencial Ticket Alto'
       when lower(g.segmentacao) = '018' then 'Potencial Valor'
       when lower(g.segmentacao) = '019' then 'Vip'
       when lower(g.segmentacao) = '020' then 'Pontuação'
       when lower(g.segmentacao) = '021' then 'Parceiros'
       when lower(g.segmentacao) = '022' then 'Pós Vendas'
       when lower(g.segmentacao) = '023' then 'Quem não abriu'
       when lower(g.segmentacao) = '024' then 'Lead Ads'
       when lower(g.segmentacao) = '025' then 'Beauty Profile'
       when lower(g.segmentacao) = '026' then 'Desengajados'
       when lower(g.segmentacao) = '027' then 'Clicou e Não Comprou'
       when lower(g.segmentacao) = '028' then 'Faixa Etária 30+'
       when lower(g.segmentacao) = '029' then 'Member Get Member'
       when lower(g.segmentacao) = '030' then 'Engajado 90 dias clicantes'
       when lower(g.segmentacao) = '031' then 'Homens'
       when lower(g.segmentacao) = '032' then 'Fishing SDS'
       when lower(g.segmentacao) = '033' then 'Região'
       when lower(g.segmentacao) = '034' then 'Pele Oleosa'
       when lower(g.segmentacao) = '035' then 'Pele Seca'
       when lower(g.segmentacao) = '036' then 'Buscou Produto'
       when lower(g.segmentacao) = '037' then 'Engajados Site 15d'
       when lower(g.segmentacao) = '038' then 'Loyalts'
       when lower(g.segmentacao) = '039' then 'Engajados 30D'
       when lower(g.segmentacao) = '040' then 'Buscou pele acneia'
       when lower(g.segmentacao) = '041' then 'Abandonou Produto'
       when lower(g.segmentacao) = '042' then 'Compradores Desconto'
       when lower(g.segmentacao) = '043' then 'Seg. Específica'
       when lower(g.segmentacao) = '044' then 'Compradores LRP'
       when lower(g.segmentacao) = '045' then 'Compradores Vichy'
       when lower(g.segmentacao) = '046' then 'Compradores Cerave'
       when lower(g.segmentacao) = '047' then 'Compradores SKC'
       when lower(g.segmentacao) = '048' then 'Interesse Vitamina C'
       when lower(g.segmentacao) = '049' then 'Compradores Kits 12 m'
       when lower(g.segmentacao) = '050' then 'Compradores recorrentes '
       when lower(g.segmentacao) = '051' then 'Tipo de pele - Oleosa'
       when lower(g.segmentacao) = '052' then 'Perfil de compra - Cupom'
       when lower(g.segmentacao) = '053' then 'TIcket Médio 499'
       when lower(g.segmentacao) = '054' then 'Compradores Skinday'
       when lower(g.segmentacao) = '055' then 'Tipo de Pele - mista a oleo'
       when lower(g.segmentacao) = '056' then 'Engaj 90d comprador'
       when lower(g.segmentacao) = '057' then 'Tipo de Pele - madura'
       when lower(g.segmentacao) = '058' then 'Interesse Acne'
       when lower(g.segmentacao) = '059' then 'Tipo de Pele - Todos'
       when lower(g.segmentacao) = '060' then 'Compradores de PDV'
       when lower(g.segmentacao) = '061' then 'Fishing KER'
       when lower(g.segmentacao) = '062' then 'Ativos'
       when lower(g.segmentacao) = '063' then 'Retenção'
       when lower(g.segmentacao) = '064' then 'Prospects'
       when lower(g.segmentacao) = '065' then 'Sem Compra'
       when lower(g.segmentacao) = '066' then 'Compradores D2C'
       when lower(g.segmentacao) = '067' then 'Engajados 90 sem compra'
       when lower(g.segmentacao) = '068' then 'Comp BF 2021'
       when lower(g.segmentacao) = '069' then 'Comp BF 2020'
       when lower(g.segmentacao) = '070' then 'Interesse Produto'
       when lower(g.segmentacao) = '071' then 'consumers'
       when lower(g.segmentacao) = '072' then 'Compradores Hidratação'
       when lower(g.segmentacao) = '073' then 'Inativos Frios'
       when lower(g.segmentacao) = '074' then 'Compradores Solar'
       when lower(g.segmentacao) = '075' then 'Compradores Limpeza'
       when lower(g.segmentacao) = '076' then 'Faixa Etária 18-35'
       when lower(g.segmentacao) = '077' then 'Abandonou Silymarin'
       when lower(g.segmentacao) = '078' then 'Compradores Silymarin'
       when lower(g.segmentacao) = '079' then 'Compradores HAIntensifier'
       when lower(g.segmentacao) = '080' then 'Compradores Proteção Solar'
       when lower(g.segmentacao) = '081' then 'Ticket Acima 299'
       when lower(g.segmentacao) = '082' then 'Compradores Blemish'
       when lower(g.segmentacao) = '083' then 'Compradores Vitamina C'
       when lower(g.segmentacao) = '084' then 'Compradores Ferulic'
       when lower(g.segmentacao) = '085' then 'Navegou e não Comprou 90d'
       when lower(g.segmentacao) = '086' then 'Compradores RJ 499 6m'
       when lower(g.segmentacao) = '087' then 'Ticket Acima 399'
       when lower(g.segmentacao) = '088' then 'Navegou e Não Comprou Kits 90d'
       when lower(g.segmentacao) = '089' then 'Interesse Solar'
       when lower(g.segmentacao) = '090' then 'Interesse AA'
       when lower(g.segmentacao) = '091' then 'Interesse Blemish'
       when lower(g.segmentacao) = '092' then 'Comp BF 2022'
       when lower(g.segmentacao) = '093' then 'Compradores RD'
       when lower(g.segmentacao) = '094' then 'TIcket Médio >269'
       when lower(g.segmentacao) = '095' then 'Compradores Mineral 89'
       when lower(g.segmentacao) = '096' then 'Mulheres'
       when lower(g.segmentacao) = '097' then 'TIcket Médio >149'
       when lower(g.segmentacao) = '098' then 'Compradores Phyto'
       when lower(g.segmentacao) = '099' then 'Compradores AA'
       when lower(g.segmentacao) = '100' then 'Compradores de SKC em RD'
       when lower(g.segmentacao) = '101' then 'Compradores de LRP em RD'
       when lower(g.segmentacao) = '102' then 'Compradores de VCH em RD'
       when lower(g.segmentacao) = '103' then 'Compradores Panvel'
       when lower(g.segmentacao) = '104' then 'Compradores Venancio'
       when lower(g.segmentacao) = '105' then 'Mulheres Ativas'
       when lower(g.segmentacao) = '106' then 'Compradores de LRP em RAIA'
       when lower(g.segmentacao) = '107' then 'Compradores de LRP em Panvel'
       when lower(g.segmentacao) = '108' then 'Compradores de LRP em d2c'
       when lower(g.segmentacao) = '109' then 'Compradores de LRP em Venancio s/ compra no mês'
       when lower(g.segmentacao) = '110' then 'Compradores Anti Oleosidade'
       when lower(g.segmentacao) = '111' then 'Split de 30mil de Desengajados 180d'
       when lower(g.segmentacao) = '112' then 'Compradores Pele Oleosa'
       when lower(g.segmentacao) = '113' then 'Compradores Últimos 30d'
       when lower(g.segmentacao) = '114' then 'Compradores 6 meses sem compra'
       when lower(g.segmentacao) = '115' then 'Reequilibrante'
       when lower(g.segmentacao) = '116' then 'Compradores Raia com freq>2'
       when lower(g.segmentacao) = '117' then 'Compradores Totais com freq>2'
       when lower(g.segmentacao) = '118' then 'Prospects Raia'
       when lower(g.segmentacao) = '119' then 'Compradore Ultracover'
       when lower(g.segmentacao) = '120' then '50% dos Prospects'
       when lower(g.segmentacao) = '121' then 'Compradores Dercos'
       when lower(g.segmentacao) = '122' then 'Compradores Raia'
       when lower(g.segmentacao) = '123' then 'Dormants'
       when lower(g.segmentacao) = '124' then 'Casual'
       when lower(g.segmentacao) = '125' then 'Dormants GC'
       when lower(g.segmentacao) = '126' then 'Casul GC'
       when lower(g.segmentacao) = '127' then 'Compradores DPSP'
       when lower(g.segmentacao) = '128' then 'Compradores Resgate'
       when lower(g.segmentacao) = '129' then 'New Prospects'
       when lower(g.segmentacao) = '130' then 'Casual WEEKLY'
       when lower(g.segmentacao) = '131' then 'Dormants WEEKLY'
       when lower(g.segmentacao) = '132' then 'Casual Controle WEEKLY'
       when lower(g.segmentacao) = '133' then 'Dormants Control WEEKLY'
       when lower(g.segmentacao) = '134' then 'Compradores Farmacia Parceira'
       when lower(g.segmentacao) = '135' then 'Respondeu Pesquisa Parceiro'
       when lower(g.segmentacao) = '136' then 'Compradores Cerave SP'
       when lower(g.segmentacao) = '137' then 'Compradores Dermaclub SP'
       when lower(g.segmentacao) = '138' then 'Compradores Festival Inverno'
       when lower(g.segmentacao) = '139' then 'Não compra Dercos 6 m'
       when lower(g.segmentacao) = '140' then 'Compradores Cicaplast' 
       when lower(g.segmentacao) = '141' then 'Aviso Geral'
       when lower(g.segmentacao) = '142' then 'BLAST' 
       when lower(g.segmentacao) = '143' then 'Validação de Cadastro' 
       when lower(g.segmentacao) = '144' then 'Jornada Clinicas' 
       when lower(g.segmentacao) = '145' then 'Jornada Hero Product Purchase' 
       when lower(g.segmentacao) = '146' then 'Jornada Sample to Full Size' 
       when lower(g.segmentacao) = '147' then 'Interesse Antioleosidade ' 
       when lower(g.segmentacao) = '148' then 'Interesse Antirrugas' 
       when lower(g.segmentacao) = '149' then 'Interesse Solar' 
       when lower(g.segmentacao) = '150' then 'Interesse Hidratação' 
       when lower(g.segmentacao) = '151' then 'Interesse Capilar'  
       when lower(g.segmentacao) = '152' then 'Prospects'
       when lower(g.segmentacao) = '153' then 'Optdown'
       when lower(g.segmentacao) = '154' then 'Desengajados Hidratação/Mineral89'
       when lower(g.segmentacao) = '155' then 'Compradores Multimarcas'
       when lower(g.segmentacao) = '156' then 'Compradores Marca Única'
       when lower(g.segmentacao) = '157' then 'Base Optout - One Shot' 
       when lower(g.segmentacao) = '158' then 'Compra Utracover - shades escuras'
       when lower(g.segmentacao) = '158' then 'Jornada Boas Vindas'  
       when lower(g.segmentacao) = '160' then 'Novos Optin'
       when lower(g.segmentacao) = '161' then 'Ganahdores - kit semanal' 
       else 'Não Parametrizado' end as segmentacao,

 case when lower(g.tipo) = 'brd' then 'Broadcast'
      when lower(g.tipo) = 'bra' then 'Broadcast Teste A'
      when lower(g.tipo) = 'brb' then 'Broadcast Teste B'
      when lower(g.tipo) = 'rep' then 'Repique'
      when lower(g.tipo) = 'seg' then 'Segmentado'
      when lower(g.tipo) = 'sea' then 'Segmentado Teste A'
      when lower(g.tipo) = 'seb' then 'Segmentado Teste B'
      when lower(g.tipo) = 'ctr' then 'Grupo de Controle'
      when lower(g.tipo) = 'tmp' then 'Template'
      when lower(g.tipo) = 'dng' then 'Desengajado'
      when lower(g.tipo) = 'sms' then 'SMS'
      when lower(g.tipo) = 'reg' then 'Jornada'
      when lower(g.tipo) = 'rea' then 'Jornada Teste A'
      when lower(g.tipo) = 'reb' then 'Jornada Teste B'
      when lower(g.tipo) = 'req' then 'Jornada Repique'
      when lower(g.tipo) = 'ert' then 'Errata'
      when lower(g.tipo) = 'dor' then 'Doments'
      when lower(g.tipo) = 'cas' then 'Casuals' else 'Não Parametrizado' end as tipo,
      
**/










CASE
   when (REGEXP_CONTAINS(mes_ano,'Janeiro') OR REGEXP_CONTAINS(mes_ano,'January')) then CONCAT('01/01/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Fevereiro') OR REGEXP_CONTAINS(mes_ano,'February')) then  CONCAT('01/02/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Marco') OR REGEXP_CONTAINS(mes_ano,'March')) then  CONCAT('01/03/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Abril') OR REGEXP_CONTAINS(mes_ano,'April')) then  CONCAT('01/04/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Maio') OR REGEXP_CONTAINS(mes_ano,'May')) then  CONCAT('01/05/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Junho') OR REGEXP_CONTAINS(mes_ano,'June')) then  CONCAT('01/06/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Julho') OR  REGEXP_CONTAINS(mes_ano,'July')) then  CONCAT('01/07/',RIGHT_TEXT(mes_ano,4))
   when ((REGEXP_CONTAINS(mes_ano,'Agosto') OR REGEXP_CONTAINS(mes_ano,'August')) then  CONCAT('01/08/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Setembro') OR REGEXP_CONTAINS(mes_ano,'Setptember')) then  CONCAT('01/09/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Outubro') OR REGEXP_CONTAINS(mes_ano,'October')) then  CONCAT('01/10/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Novembro') OR REGEXP_CONTAINS(mes_ano,'November')) then  CONCAT('01/11/',RIGHT_TEXT(mes_ano,4))
   when (REGEXP_CONTAINS(mes_ano,'Dezembro') OR REGEXP_CONTAINS(mes_ano,'December')) then  CONCAT('01/12/',RIGHT_TEXT(mes_ano,4))
END












===========================================================================================================================================================================
===========================================================================================================================================================================
===========================================================================================================================================================================
===========================================================================================================================================================================



#Regras DMC - Tipo de Envio

CASE
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REG|XXXXXX|-REA|-REB|-REQ') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP-REG') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Abandoned_Cart') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Boleto_Paid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Boleto_Expired') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Boleto_NoPaid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Payment_Confirmed_Pix') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Rejected_Payment') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Cancelled') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Order_Status_Brain') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Return') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Shipping_Notification') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Account_Creation') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'DMC_BRA_Newsletter') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha, 'DMC_BRA_Payment_Confirmed_PIX') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-BROAD|-BRD|-BRA|-BRB') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-SEG|-SEA|SEB') THEN "Segmentado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-TEMP|-TMP') THEN "Template"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DNG') THEN "Desengajado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP') THEN "Repique"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-ERT') THEN "Errata"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DOR') THEN "Doments"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CAS') THEN "Casuals"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CTR') THEN "Grupo de Controle"
    ELSE "Broadcast"

END


#Regras DMC - Origem


CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'cpc|cpm|cpv') THEN "Mídia"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'organic') THEN "Orgânico"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|whatsapp / bic|whatsapp / BIC|whatsapp / prog_deal|whatsapp-dmc / chat|whatsapp / link_bot|whatsapp / social_post_orga|whatsapp / community-manager|whatsapp / ba|whatsapp / dirbuy_display|whatsapp / prog_native') THEN "CRM"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'direct') THEN "Direto"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'referral') THEN "Referência"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'social') THEN "Social"
ELSE "Outros"

END




===========================================================================================================================================================================

#Regras SKC - Tipo de Envio


CASE
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REG|XXXXXX|-REA|-REB|-REQ') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP-REG') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Account_Creation') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Boleto_Expired') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Boleto_NoPaid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Boleto_Paid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Cancelled') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Newsletter') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Order_Status_Brain') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Payment_Confirmed_PIX') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Rejected_Payment') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Return') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRA_Shipping_Notification') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'SKI_BRZ_Abandont_Cart') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'ALLCOUNTRY_CONTROLGROUP_NOTIFICATIONLast') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'AFN7_SKIN_BRA_NPS-B2C-Post-Purchase_1_2023') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-BROAD|-BRD|-BRA|-BRB') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-SEG|-SEA|SEB') THEN "Segmentado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-TEMP|-TMP') THEN "Template"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DNG') THEN "Desengajado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP') THEN "Repique"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-ERT') THEN "Errata"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DOR') THEN "Doments"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CAS') THEN "Casuals"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CTR') THEN "Grupo de Controle"

        ELSE "Broadcast"

END



#Regras SKC - Origem



CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'cpc|cpm|cpv') THEN "Mídia"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'organic') THEN "Orgânico"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email') THEN "CRM"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'direct') THEN "Direto"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'referral') THEN "Referência"

ELSE "Outros"

END


===========================================================================================================================================================================

#Regras LAN - Tipo de Envio



CASE
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REG|XXXXXX|-REA|-REB|-REQ') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP-REG') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_BOLETO_PAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_ABANDONED_CART') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_ACCOUNT_CREATION') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_SHIPPING_NOTIFICATION') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_BOLETO_PAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_BOLETO_NOPAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_BOLETO_EXPIRED') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_NEWSLETTER') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_CANCELLED') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_ORDER_STATUS_BRAIN') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_ORDER_STATUS') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_PAYMENT_CONFIRMED_PIX') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_REJECTED_PAYMENT') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-BROAD|-BRD|-BRA|-BRB') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-SEG|-SEA|SEB') THEN "Segmentado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-TEMP|-TMP') THEN "Template"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DNG') THEN "Desengajado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP') THEN "Repique"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-ERT') THEN "Errata"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DOR') THEN "Doments"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CAS') THEN "Casuals"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CTR') THEN "Grupo de Controle"

        ELSE "Broadcast"

END



#Regras LAN - Origem

CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'cpc|cpm|cpv') THEN "Mídia"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'organic') THEN "Orgânico"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email') THEN "CRM"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'direct') THEN "Direto"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'referral') THEN "Referência"

ELSE "Outros"

END



===========================================================================================================================================================================


#Regras SDS - Tipo de Envio

CASE
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REG|XXXXXX|-REA|-REB|-REQ') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP-REG') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_ABANDONED_CART') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_BOLETO_PAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_BOLETO_EXPIRED') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_BOLETO_NOPAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_PAYMENT_CONFIRMED_PIX') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_REJECTED_PAYMENT') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_CANCELLED') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_ORDER_STATUS_BRAIN') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_RETURN') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_SHIPPING_NOTIFICATION') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_ACCOUNT_CREATION') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_NEWSLETTER') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-BROAD|-BRD|-BRA|-BRB') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-SEG|-SEA|SEB') THEN "Segmentado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-TEMP|-TMP') THEN "Template"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DNG') THEN "Desengajado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP') THEN "Repique"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-ERT') THEN "Errata"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DOR') THEN "Doments"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CAS') THEN "Casuals"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CTR') THEN "Grupo de Controle"

        ELSE "Broadcast"

END




#Regras SDS - Origem

CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'cpc|cpm|cpv') THEN "Mídia"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'organic') THEN "Orgânico"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email') THEN "CRM"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'direct') THEN "Direto"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'referral') THEN "Referência"

ELSE "Outros"

END


===========================================================================================================================================================================


#Regras KER - Tipo de Envio

CASE
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REG|XXXXXX|-REA|-REB|-REQ') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP-REG') THEN "Jornada"
   WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Abandoned_Cart') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'abandoned cart 1 2023') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Boleto_Paid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Boleto_Expired') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Boleto_NoPaid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Payment_Confirmed_Pix') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Rejected_Payment') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Cancelled') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Order_Status_Brain') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Return') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Shipping_Notification_2023') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Account_Creation') THEN "Jornada"
    WHEN REGEXP_CONTAINS(dCampanha,'KER_BRZ_Newsletter') THEN "Jornada"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-BROAD|-BRD|-BRA|-BRB') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-SEG|-SEA|SEB') THEN "Segmentado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-TEMP|-TMP') THEN "Template"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DNG') THEN "Desengajado"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-REP') THEN "Repique"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-ERT') THEN "Errata"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-DOR') THEN "Doments"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CAS') THEN "Casuals"
    WHEN REGEXP_CONTAINS(UPPER(dCampanha),'-CTR') THEN "Grupo de Controle"

        ELSE "Broadcast"

END


#Regras KER - Tipo de Envio

CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'cpc|cpm|cpv') THEN "Mídia"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'organic') THEN "Orgânico"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email') THEN "CRM"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'direct') THEN "Direto"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'referral') THEN "Referência"

ELSE "Outros"

END




Tipo de Canal
CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp|wpp') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(dCampanha),'whatsapp|wpp') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'sms') THEN "SMS"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|alesforce|email') THEN "E-mail"

ELSE "Outros"

END











































CASE
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'cpc|cpm|cpv') THEN "Mídia"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'organic') THEN "Orgânico"
    WHEN REGEXP_CONTAINS(Marca, "DMC") and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|whatsapp / bic|whatsapp / BIC|whatsapp / prog_deal|whatsapp-dmc / chat|whatsapp / link_bot|whatsapp / social_post_orga|whatsapp / community-manager|whatsapp / ba|whatsapp / dirbuy_display|whatsapp / prog_native') THEN "CRM"
    WHEN REGEXP_CONTAINS(Marca, "SKC") and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|crm / email|whatsapp / disparo|whatsapp / bic|whatsapp / BIC|whatsapp / (not set)|whatsapp') THEN "CRM"
    WHEN REGEXP_CONTAINS(Marca, "SDS") and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|whatsapp / disparo|whatsapp / bic') THEN "CRM"
    WHEN (REGEXP_CONTAINS(Marca, "KER") or REGEXP_CONTAINS(Marca, "VCY") or REGEXP_CONTAINS(Marca, "CRV") or REGEXP_CONTAINS(Marca, "LRP")) and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email') THEN "CRM"
    WHEN REGEXP_CONTAINS(Marca, "LAN") and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|whatsapp / disparo|whatsapp / bic|whatsapp / BIC') THEN "CRM"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'direct') THEN "Direto"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'referral') THEN "Referência"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'social') THEN "Social"
ELSE "Outros"
END

















    WHEN REGEXP_CONTAINS(Marca, "DMC") and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|whatsapp / bic|whatsapp / BIC|whatsapp / prog_deal|whatsapp-dmc / chat|whatsapp / link_bot|whatsapp / social_post_orga|whatsapp / community-manager|whatsapp / ba|whatsapp / dirbuy_display|whatsapp / prog_native') THEN "CRM"
    WHEN REGEXP_CONTAINS(Marca, "SKC") and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|crm / email|whatsapp / disparo|whatsapp / bic|whatsapp / BIC|whatsapp / (not set)|whatsapp') THEN "CRM"
    WHEN REGEXP_CONTAINS(Marca, "SDS") and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|whatsapp / disparo|whatsapp / bic') THEN "CRM"
    WHEN (REGEXP_CONTAINS(Marca, "KER") or REGEXP_CONTAINS(Marca, "VCY") or REGEXP_CONTAINS(Marca, "CRV") or REGEXP_CONTAINS(Marca, "LRP")) and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email') THEN "CRM"
    WHEN REGEXP_CONTAINS(Marca, "LAN") and REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|whatsapp / disparo|whatsapp / bic|whatsapp / BIC') THEN "CRM"




DMC
CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp|wpp') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(dCampanha),'whatsapp|wpp') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'sms') THEN "SMS"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|alesforce|email') THEN "E-mail"

ELSE "Outros"


SKC
CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp / disparo|whatsapp / bic|whatsapp / BIC') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'sms') THEN "SMS"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email|crm / email') THEN "E-mail"

ELSE "Outros"

END




LAN
CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp / disparo|whatsapp / bic|whatsapp / BIC') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'sms') THEN "SMS"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email') THEN "E-mail"

ELSE "Outros"

END





KER
CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp|wpp') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(dCampanha),'whatsapp|wpp') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'sms') THEN "SMS"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email') THEN "E-mail"

ELSE "Outros"

END




SDS
CASE

    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp / disparo|whatsapp / bic|whatsapp / BIC') THEN "WhatsApp"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'sms') THEN "SMS"
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'crm|salesforce|email') THEN "E-mail"

ELSE "Outros"

END







CASE
    WHEN REGEXP_CONTAINS(Marca, 'DMC') and REGEXP_CONTAINS(Canal, 'CRM') and (REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp|wpp') OR REGEXP_CONTAINS(LOWER(dCampanha),'whatsapp|wpp')) THEN 'WhatsApp'
    WHEN REGEXP_CONTAINS(Marca, 'SKC') and REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp / disparo|whatsapp / bic|whatsapp / BIC') THEN 'WhatsApp'
    WHEN REGEXP_CONTAINS(Marca, 'LAN') and REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp / disparo|whatsapp / bic|whatsapp / BIC') THEN 'WhatsApp'
    WHEN REGEXP_CONTAINS(Marca, 'KER') and REGEXP_CONTAINS(Canal, 'CRM') and (REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp|wpp') OR REGEXP_CONTAINS(LOWER(dCampanha),'whatsapp|wpp')) THEN 'WhatsApp'
    WHEN REGEXP_CONTAINS(Marca, 'SDS') and REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(LOWER(sourcemedium),'whatsapp / disparo|whatsapp / bic|whatsapp / BIC') THEN 'WhatsApp'
    WHEN REGEXP_CONTAINS(LOWER(sourcemedium),'sms') THEN "SMS"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-REG|XXXXXX|-REA|-REB|-REQ') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-REP-REG') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Abandoned_Cart') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Boleto_Paid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Boleto_Expired') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Boleto_NoPaid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Payment_Confirmed_Pix') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Rejected_Payment') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Cancelled') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Order_Status_Brain') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Return') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Shipping_Notification') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Account_Creation') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Newsletter') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'DMC_BRA_Payment_Confirmed_PIX') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Account_Creation') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Boleto_Expired') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Boleto_NoPaid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Boleto_Paid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Cancelled') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Newsletter') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Order_Status_Brain') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Payment_Confirmed_PIX') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Rejected_Payment') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Return') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRA_Shipping_Notification') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'SKI_BRZ_Abandont_Cart') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'ALLCOUNTRY_CONTROLGROUP_NOTIFICATIONLast') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'AFN7_SKIN_BRA_NPS-B2C-Post-Purchase_1_2023') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_BOLETO_PAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_ABANDONED_CART') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_ACCOUNT_CREATION') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_SHIPPING_NOTIFICATION') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_BOLETO_PAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_BOLETO_NOPAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_BOLETO_EXPIRED') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_NEWSLETTER') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_CANCELLED') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_ORDER_STATUS_BRAIN') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_ORDER_STATUS') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_PAYMENT_CONFIRMED_PIX') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'LAN_BRA_REJECTED_PAYMENT') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_ABANDONED_CART') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_BOLETO_PAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_BOLETO_EXPIRED') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_BOLETO_NOPAID') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_PAYMENT_CONFIRMED_PIX') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_REJECTED_PAYMENT') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_CANCELLED') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_ORDER_STATUS_BRAIN') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_RETURN') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_SHIPPING_NOTIFICATION') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_ACCOUNT_CREATION') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'SDS_BRA_NEWSLETTER') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Abandoned_Cart') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'abandoned cart 1 2023') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Boleto_Paid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Boleto_Expired') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Boleto_NoPaid') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Payment_Confirmed_Pix') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Rejected_Payment') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Cancelled') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Order_Status_Brain') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Return') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Shipping_Notification_2023') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Account_Creation') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(dCampanha,'KER_BRZ_Newsletter') THEN "Jornada"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-BROAD|-BRD|-BRA|-BRB') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-SEG|-SEA|SEB') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-TEMP|-TMP') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-DNG') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-REP') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-ERT') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-DOR') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-CAS') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-CTR') THEN "Broadcast"
    WHEN REGEXP_CONTAINS(Canal, 'CRM') and REGEXP_CONTAINS(UPPER(dCampanha),'-SMS') THEN "Broadcast"
    ELSE "Broadcast"

END

























CASE
   when REGEXP_CONTAINS(mes_ano,'January') then CONCAT('Janeiro',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'February') then  CONCAT('Fevereiro',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'March') then  CONCAT('Março',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'April') then  CONCAT('Abril',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'May') then  CONCAT('Maio',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'June') then  CONCAT('Junho',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'July') then  CONCAT('Julho',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'August') then  CONCAT('Agosto',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'September') then  CONCAT('Setembrp',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'Outubro') then  CONCAT('Outubro',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'November') then  CONCAT('Novembro',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'December') then  CONCAT('Dezembro',RIGHT_TEXT(mes_ano,4))
END
   




   CASE 
WHEN REGEXP_CONTAINS(Mês-Texto, 'Janeiro') THEN '1'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Fevereiro') THEN '2'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Março') THEN '3'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Abril') THEN '4'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Maio') THEN '5'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Junho') THEN '6'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Julho') THEN '7'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Agosto') THEN '8'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Setembro') THEN '9'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Outubro') THEN '10'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Novembro') THEN '11'
WHEN REGEXP_CONTAINS(Mês-Texto, 'Dezembro') THEN '12'
END





CAST(Mês-Texto as Date)
CASE
   when REGEXP_CONTAINS(mes_ano,'January') then CONCAT('Janeiro ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'February') then  CONCAT('Fevereiro ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'March') then  CONCAT('Março ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'April') then  CONCAT('Abril ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'May') then  CONCAT('Maio ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'June') then  CONCAT('Junho ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'July') then  CONCAT('Julho ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'August') then  CONCAT('Agosto ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'September') then  CONCAT('Setembro ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'Outubro') then  CONCAT('Outubro ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'November') then  CONCAT('Novembro ',RIGHT_TEXT(mes_ano,4))
   when REGEXP_CONTAINS(mes_ano,'December') then  CONCAT('Dezembro ',RIGHT_TEXT(mes_ano,4))
END
   










  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')), '-')) >= 4 and (TRIM(novo.ga_campaign) like 'A%' or TRIM(novo.ga_campaign) like 'SD%' or TRIM(novo.ga_campaign) like 'SS%') and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')),'-')[OFFSET(3)], r'[^_]+') ELSE NULL END as eCommerce,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')), '-')) >= 5 and (TRIM(novo.ga_campaign) like 'A%' or TRIM(novo.ga_campaign) like 'SD%' or TRIM(novo.ga_campaign) like 'SS%') and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')),'-')[OFFSET(4)], r'[^_]+') ELSE NULL END as marca,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')), '-')) >= 6 and (TRIM(novo.ga_campaign) like 'A%' or TRIM(novo.ga_campaign) like 'SD%' or TRIM(novo.ga_campaign) like 'SS%') and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')),'-')[OFFSET(5)], r'[^_]+') ELSE NULL END as tema,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')), '-')) >= 7 and (TRIM(novo.ga_campaign) like 'A%' or TRIM(novo.ga_campaign) like 'SD%' or TRIM(novo.ga_campaign) like 'SS%') and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')),'-')[OFFSET(6)], r'[^_]+') ELSE NULL END as repCampanha,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')), '-')) >= 8 and (TRIM(novo.ga_campaign) like 'A%' or TRIM(novo.ga_campaign) like 'SD%' or TRIM(novo.ga_campaign) like 'SS%') and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')),'-')[OFFSET(7)], r'[^_]+') ELSE NULL END as exclusividade,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')), '-')) >= 9 and (TRIM(novo.ga_campaign) like 'A%' or TRIM(novo.ga_campaign) like 'SD%' or TRIM(novo.ga_campaign) like 'SS%') and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')),'-')[OFFSET(8)], r'[^_]+') ELSE NULL END as segmentacao,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')), '-')) >= 10 and (TRIM(novo.ga_campaign) like 'A%' or TRIM(novo.ga_campaign) like 'SD%' or TRIM(novo.ga_campaign) like 'SS%') and CAST(PARSE_DATE("%Y%m%d", novo.ga_date) as DATE) >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(novo.ga_campaign, '_', '-')),'-')[OFFSET(9)], r'[^_]+') ELSE NULL END as tipo



  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')), '-')) >= 4 and (TRIM(sends.email_name) like 'A%' or TRIM(sends.email_name) like 'SD%' or TRIM(sends.email_name) like 'SS%') and sends.send_date >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')),'-')[OFFSET(3)], r'[^_]+') ELSE NULL END as eCommerce,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')), '-')) >= 5 and (TRIM(sends.email_name) like 'A%' or TRIM(sends.email_name) like 'SD%' or TRIM(sends.email_name) like 'SS%') and sends.send_date >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')),'-')[OFFSET(4)], r'[^_]+') ELSE NULL END as marca,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')), '-')) >= 6 and (TRIM(sends.email_name) like 'A%' or TRIM(sends.email_name) like 'SD%' or TRIM(sends.email_name) like 'SS%') and sends.send_date >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')),'-')[OFFSET(5)], r'[^_]+') ELSE NULL END as tema,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')), '-')) >= 7 and (TRIM(sends.email_name) like 'A%' or TRIM(sends.email_name) like 'SD%' or TRIM(sends.email_name) like 'SS%') and sends.send_date >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')),'-')[OFFSET(6)], r'[^_]+') ELSE NULL END as repCampanha,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')), '-')) >= 8 and (TRIM(sends.email_name) like 'A%' or TRIM(sends.email_name) like 'SD%' or TRIM(sends.email_name) like 'SS%') and sends.send_date >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')),'-')[OFFSET(7)], r'[^_]+') ELSE NULL END as exclusividade,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')), '-')) >= 9 and (TRIM(sends.email_name) like 'A%' or TRIM(sends.email_name) like 'SD%' or TRIM(sends.email_name) like 'SS%') and sends.send_date >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')),'-')[OFFSET(8)], r'[^_]+') ELSE NULL END as segmentacao,
  CASE WHEN ARRAY_LENGTH(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')), '-')) >= 10 and (TRIM(sends.email_name) like 'A%' or TRIM(sends.email_name) like 'SD%' or TRIM(sends.email_name) like 'SS%') and sends.send_date >= '2023-05-01' THEN REGEXP_EXTRACT(SPLIT(TRIM(REPLACE(sends.email_name, '_', '-')),'-')[OFFSET(9)], r'[^_]+') ELSE NULL END as tipo,


























LOAD DATA OVERWRITE `enext-datarepository.loreal_dmc.dmc_sfmc_sends`
FROM FILES(
  skip_leading_rows=1,
  format='CSV',
  uris = ['gs://enext-loreal/dmc/dmc-sfmc-sends*']
)


Loreal_Dca_Dmc_Up_Arquivos_Sends










Source = MySQL.Database("ec2-3-222-181-93.compute-1.amazonaws.com", "db_dermaclub", [ReturnSingleDatabase=true]),
    db_dermaclub_dmc_sfmc_sends = Source{[Schema="db_dermaclub",Item="dmc_sfmc_sends"]}[Data],





















select 

kondado.senddate as senddate,
kondado.previewurl,
kondado.emailname

from `enext-datarepository.loreal_dca.dmc_sfmc_sends_kondado` kondado

where kondado.emailname like '%ADR1_DMC_BRA_ATT-VN-VC-CP-05-N-104-SEG_1_2023%'

order by senddate desc











