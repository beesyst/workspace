# DNS

---

## Типы DNS-записей

| Тип     | Назначение                      | Пример                                                   |
| ------- | ------------------------------- | -------------------------------------------------------- |
| `A`     | Имя → IPv4                      | `app.example.com. A 203.0.113.10`                        |
| `AAAA`  | Имя → IPv6                      | `www.example.com. AAAA 2001:db8::10`                     |
| `CNAME` | Алиас на имя                    | `api.example.com. CNAME srv-123.cloud.net.`              |
| `MX`    | Почтовые сервера                | `example.com. MX 10 mail1.example.com.`                  |
| `NS`    | Авторитетные NS зоны            | `example.com. NS ns1.example.net.`                       |
| `TXT`   | Текст/проверки (SPF/DMARC)      | `v=spf1 include:_spf.example.net -all`                   |
| `SRV`   | Сервис→хост:порт                | `_sip._tcp.example.com. SRV 10 5 5060 sip1.example.com.` |
| `PTR`   | Обратная зона (IP→имя)          | `10.113.0.203.in-addr.arpa. PTR host.example.com.`       |
| `CAA`   | Разрешённые CA                  | `example.com. CAA 0 issue "letsencrypt.org"`             |
| `SOA`   | Старт зоны (серийник, тайминги) | Параметры репликации вторичных NS                        |
