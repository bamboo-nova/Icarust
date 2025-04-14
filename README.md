# Icarust
Object detection server with rust

# Develop

```
$ source ./.env
```

## dokcerのイメージをGoogle Artifact Registry(GAR)にプッシュする

GARにプッシュする時はパイプライン実行時のみで良いので、開発中はビルドだけで良い。

```
$ gcloud auth configure-docker asia-northeast1-docker.pkg.dev --quiet
```

```
# ビルド
docker compose build (v2)

# GARへプッシュ
docker compose push (v2)
```

2. dockerイメージの構築

```
$ DOCKER_BUILDKIT=1 docker build . -t icarust-image
```

3. コンテナの起動

```
$ docker compose run --rm icarust-demo
```
