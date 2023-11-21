


==========================================================================================================================

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

use db_dermaclub;
select 
FORMAT(t.novos + t.primeiracompra + t.recompradores+ t.retidos , 2)as Total,
       grupo,
       t.mes_ano
from dmc_de_novo_dados_transaction_dmc t 

where  t.grupo = 'TOTAL'

==========================================================================================================================


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