




# buscara por contenido del log

fields @timestamp, @message
| filter @message like /user not found/
| filter @message like /User\snot\sfound/
| sort @timestamp desc
| limit 20


# buscara por contenido del log
fields @timestamp, @message, strcontains(@message, "user not found") AS unf
| filter unf=1
| sort @timestamp desc
| limit 20

:: otro filtro regex
fields @timestamp, @message
| sort @timestamp desc
| limit 20 | filter @message like /(?i)(Exception|error|fail|5dd)/


:: usados
fields @timestamp, @message, @type, @requestId, @billedDuration
| sort @timestamp desc
| filter @message like /v5731838wofp-01/
# | filter type_log like /LOG/
| limit 5000
