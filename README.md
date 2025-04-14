# Icarust
Object detection server with rust

# Develop

```
$ source ./.env
```

0. 事前に必要な準備

cloudrun周りのgcpへの認証など

```
gcloud auth login
gcloud config set project <project-id>


gcloud auth application-default login
gcloud services enable run.googleapis.com
```

1. dokcerのイメージをGoogle Artifact Registry(GAR)にプッシュする

```
$ gcloud auth configure-docker <region>-docker.pkg.dev --quiet
```

```
# ビルド
docker compose build

# GARへプッシュ
docker compose push
```

2. 動作確認

```
$ docker run -p 8080:8080 <IMAGE ID>
```

3. デプロイ

```
terraform init
terraform plan
terraform apply

# 消去時
terraform destroy
```
