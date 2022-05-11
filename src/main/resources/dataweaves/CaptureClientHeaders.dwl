%dw 2.0
output application/java
---
{
	id: attributes.headers.client_id,
	secret: attributes.headers.client_secret
}