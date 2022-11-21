PERICIAL
=========

Deberemos construir la base de datos y sus procesos para dar soporte a un gabinete pericial.

La empresa, recibe encargos por parte de sus clientes para peritar los diversos siniestros. Cada encargo recibe la información de:

- Poliza del seguro, aseguradora, coberturas aseguradas y el importe
- Datos del asegurado: nombre, apellidos, dirección, telefono, correo
- Datos de contacto: Puede o no coincidir con los del asegurado
- Descripción y dirección del siniestro

Una vez recibidos por el gabinete, los siniestros son asignados a un perito para que comience su tramitación. 

Estados
-------- 
- Recibido: Se ha registrado la información del siniestro
- Revisado: El encargado de hacerlo, ha chequeado que todos los datos son correctos. Y asignado un *ramo* al siniestro (fuego, viento, agua, robo)
- Asignado: El siniestro ha sido asignado a uno de los peritos de la empresa. Esté será el responsable de su gestión
- Visitado: El perito se ha desplazado al siniestro, y ha tomado las notas y documentación pertinentes para poder elaborar un informe completo
- Cerrado: El perito ha realizado el informe, rellenando el importe de imdenización e informado a la compañía de seguros.
- Facturado: El gabinete ha facturado sus servicios al cliente (cliente != compañía)
	
Existen ciertas reglas para cambiar de estaddo:

Recibido -> Revisado: Lo hace una persona de manera manual.
Revisado -> Asignado: Diariamente se lanza un proceso automático, la máquina asigna los nuevos siniestos al perito menos ocupado
Asignado -> Visitado: Lo hace manualmente el perito, pero se precisa un fecha y hora de la visita, así como la existencia de alguna nota
Visitado -> Cerrado: Hacer el informe de compañía. No se puede cerrar un siniestro si no existe un importe propuesto de indemnización. Ojo con las coberturas.
Cerrado -> Facturado: Diariamente se lanza un proceso de facturación, que crea la factura de todos los siniestros cerrados. Se facturan tres conceptos, un importe fijo de 100@€, un 0.1% de la propuesta de indemnización y el desplazamiento, esto es los Km recorridos por el perito desde su oficina hasta el siniestro ( a precio fijo de 0,19 €/Km)

Informes
--------

La empresa necesita mensualmente información sobre:
- Importes facturados a cada cliente, totales y con detalle por *ramo*
- Para cada perito, número de siniestros resueltos en el mes, número de siniestros pendientes y tiempo medio de resolución (tiempo transcurrido desde que llega el aviso, hasta que se cierra)