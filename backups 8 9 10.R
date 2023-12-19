library(stringr)


(Recebido="D:\\System\\Data\\Arquivos de Programas RFB\\aplicação\\dados\\212121212121\\Lixo\\Cut\\outputs 2\\Exchange\\Recebido\\")
(Acer_recebido="C:\\System\\Data\\Arquivos de Programas RFB\\IRPF2015\\aplicacao\\dados\\212121212121\\Lixo\\Cut\\outputs 2\\Exchange\\Backup Recebido (notas igual ou acima de 8)\\")
(recs=list.files(Recebido))
(recs=recs[str_detect(recs, "#10#") | str_detect(recs, "#9#") | str_detect(recs, "#8#")])
(jabackup=list.files(Acer_recebido))

#ver se tem tamanho=0 para excluir
jabackup[file.size(paste0(Acer_recebido,jabackup))==0]
any(jabackup[file.size(paste0(Acer_recebido,jabackup))==0])


vetor=unlist(lapply(recs,function(x) !(x %in% jabackup)))

(recs=recs[vetor])

if(length(recs) !=0){file.copy(from=paste0(Recebido,recs), to=Acer_recebido)}


#fazer novo backup em antigo Acer