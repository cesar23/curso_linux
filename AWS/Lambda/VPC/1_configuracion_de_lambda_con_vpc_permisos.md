# configuracion de lambda con VPC

fuente:
- https://www.youtube.com/watch?v=beV1AYyhgYA

### 1. entrar a la  lambda y editar 
editar los permisos del rol

<img width="100%" src="https://i.imgur.com/SYw0xo4.png" alt="My cool logo"/>

-- -- 

### 2. Ahora nos dirigimos y editaremos

<img width="100%" src="https://i.imgur.com/H2FyXNC.png" alt="My cool logo"/>

-- -- 

### 3. editaremos el rol que a sido asignado y lo editaremos

<img width="100%" src="https://i.imgur.com/s0V8JVK.png" alt="My cool logo"/>

-- -- 

Ahora lo que tenmos es esto:

```javascript
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-1:252878719353:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-east-1:252878719353:log-group:/aws/lambda/niubiz:*"
            ]
        }
    ]
}
```
Lo editaremos por esto que le dara los permisos
```javascript
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-1:252878719353:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-east-1:252878719353:log-group:/aws/lambda/niubiz:*"
            ]
        },
        // start :: agregar esto para que tenga permisos
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeNetworkInterfaces",
                "ec2:CreateNetworkInterface",
                "ec2:DeleteNetworkInterface",
                "ec2:DescribeInstances",
                "ec2:AttachNetworkInterface"
            ],
            "Resource": "*"
        }
        // end :: agregar esto para que tenga permisos
    ]
}
```