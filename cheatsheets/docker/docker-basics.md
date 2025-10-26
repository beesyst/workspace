# Docker Основы

## Оглавление

- [Установка и документы](#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B8-%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D1%8B)
- [Образы (Images)](#%D0%9E%D0%B1%D1%80%D0%B0%D0%B7%D1%8B-images)
  - [Собрать образ из Dockerfile](#%D0%A1%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D1%8C-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7-%D0%B8%D0%B7-dockerfile)
  - [Сборка без использования кэша](#%D0%A1%D0%B1%D0%BE%D1%80%D0%BA%D0%B0-%D0%B1%D0%B5%D0%B7-%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F-%D0%BA%D1%8D%D1%88%D0%B0)
  - [Список локальных образов](#%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA-%D0%BB%D0%BE%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D1%85-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%B2)
  - [Удалить образ](#%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7)
  - [Удалить все неиспользуемые образы](#%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C-%D0%B2%D1%81%D0%B5-%D0%BD%D0%B5%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D0%B5%D0%BC%D1%8B%D0%B5-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D1%8B)
- [Docker Hub](#docker-hub)
  - [Войти в Docker Hub](#%D0%92%D0%BE%D0%B9%D1%82%D0%B8-%D0%B2-docker-hub)
  - [Опубликовать образ](#%D0%9E%D0%BF%D1%83%D0%B1%D0%BB%D0%B8%D0%BA%D0%BE%D0%B2%D0%B0%D1%82%D1%8C-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7)
  - [Поиск образа на Hub](#%D0%9F%D0%BE%D0%B8%D1%81%D0%BA-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%B0-%D0%BD%D0%B0-hub)
  - [Скачать (pull) образ](#%D0%A1%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C-pull-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7)
- [Общие команды](#%D0%9E%D0%B1%D1%89%D0%B8%D0%B5-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B)
  - [Запустить демон Docker (Linux)](#%D0%97%D0%B0%D0%BF%D1%83%D1%81%D1%82%D0%B8%D1%82%D1%8C-%D0%B4%D0%B5%D0%BC%D0%BE%D0%BD-docker-linux)
  - [Справка по Docker (можно добавлять --help к любому подкоманду)](#%D0%A1%D0%BF%D1%80%D0%B0%D0%B2%D0%BA%D0%B0-%D0%BF%D0%BE-docker)
  - [Системная информация](#%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%BD%D0%B0%D1%8F-%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D1%8F)
- [Контейнеры](#%D0%9A%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D1%8B)
  - [Создать и запустить контейнер из образа с собственным именем](#%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C-%D0%B8-%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D1%82%D0%B8%D1%82%D1%8C-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80-%D0%B8%D0%B7-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%B0-%D1%81-%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC-%D0%B8%D0%BC%D0%B5%D0%BD%D0%B5%D0%BC)
  - [Пробросить порты контейнера на хост](#%D0%9F%D1%80%D0%BE%D0%B1%D1%80%D0%BE%D1%81%D0%B8%D1%82%D1%8C-%D0%BF%D0%BE%D1%80%D1%82%D1%8B-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B0-%D0%BD%D0%B0-%D1%85%D0%BE%D1%81%D1%82)
  - [Запуск в фоне (detached)](#%D0%97%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D0%B2-%D1%84%D0%BE%D0%BD%D0%B5-detached)
  - [Старт/стоп существующего контейнера](#%D0%A1%D1%82%D0%B0%D1%80%D1%82%D1%81%D1%82%D0%BE%D0%BF-%D1%81%D1%83%D1%89%D0%B5%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%89%D0%B5%D0%B3%D0%BE-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B0)
  - [Удалить остановленный контейнер](#%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C-%D0%BE%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80)
  - [Открыть shell внутри работающего контейнера](#%D0%9E%D1%82%D0%BA%D1%80%D1%8B%D1%82%D1%8C-shell-%D0%B2%D0%BD%D1%83%D1%82%D1%80%D0%B8-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D1%8E%D1%89%D0%B5%D0%B3%D0%BE-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B0)
  - [Логи контейнера (с “подпиской”)](#%D0%9B%D0%BE%D0%B3%D0%B8-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B0-%D1%81-%E2%80%9C%D0%BF%D0%BE%D0%B4%D0%BF%D0%B8%D1%81%D0%BA%D0%BE%D0%B9%E2%80%9D)
  - [Информация о контейнере](#%D0%98%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D1%8F-%D0%BE-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B5)
  - [Список запущенных контейнеров](#%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA-%D0%B7%D0%B0%D0%BF%D1%83%D1%89%D0%B5%D0%BD%D0%BD%D1%8B%D1%85-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%BE%D0%B2)
  - [Список всех контейнеров (включая остановленные)](#%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA-%D0%B2%D1%81%D0%B5%D1%85-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%BE%D0%B2-%D0%B2%D0%BA%D0%BB%D1%8E%D1%87%D0%B0%D1%8F-%D0%BE%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5)
  - [Статистика использования ресурсов](#%D0%A1%D1%82%D0%B0%D1%82%D0%B8%D1%81%D1%82%D0%B8%D0%BA%D0%B0-%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F-%D1%80%D0%B5%D1%81%D1%83%D1%80%D1%81%D0%BE%D0%B2)

---

## Установка и документы

Docker Desktop доступен для **macOS, Linux и Windows**:  
<https://docs.docker.com/desktop>

Примеры проектов с Docker (compose-наборы):  
<https://github.com/docker/awesome-compose>

Полная документация Docker:  
<https://docs.docker.com>

## Образы (Images)

### Собрать образ из Dockerfile

```
docker build -t <image_name>
```

### Сборка без использования кэша

```
docker build -t <image_name> . --no-cache
```

### Список локальных образов

```
docker images
```

### Удалить образ

```
docker rmi <image_name>
```

### Удалить все неиспользуемые образы

```
docker image prune
```

## Docker Hub

https://hub.docker.com

### Войти в Docker Hub

```
docker login -u <username>
```

### Опубликовать образ

```
docker push <username>/<image_name>
```

### Поиск образа на Hub

```
docker search <image_name>
```

### Скачать (pull) образ

```
docker pull <image_name>
```

## Общие команды

### Запустить демон Docker (Linux)

```
dockerd
```

### Справка по Docker

```
docker --help
```

### Системная информация

```
docker info
```

## Контейнеры

### Создать и запустить контейнер из образа с собственным именем

```
docker run --name <container_name> <image_name>
```

### Пробросить порты контейнера на хост

```
docker run -p <host_port>:<container_port> <image_name>
```

### Запуск в фоне (detached)

```
docker run -d <image_name>
```

### Старт/стоп существующего контейнера

```
docker start <container_name_or_id>
docker stop  <container_name_or_id>
```

### Удалить остановленный контейнер

```
docker rm <container_name>
```

### Открыть shell внутри работающего контейнера

```
docker exec -it <container_name> sh
# (или bash, если он есть в контейнере)
```

### Логи контейнера (с “подпиской”)

```
docker logs -f <container_name>
```

### Информация о контейнере

```
docker inspect <container_name_or_id>
```

### Список запущенных контейнеров

```
docker ps
```

### Список всех контейнеров (включая остановленные)

```
docker ps --all
```

### Статистика использования ресурсов

```
docker container stats
```