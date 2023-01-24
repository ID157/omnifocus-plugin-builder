# About
To Do アプリ OmniFocus3 のプラグインを作成するための補助ツールです。

rollup を用いたバンドルを行うことで、

1. tsの型検査
2. コードの分割・モジュール化
3. ライブラリの使用

以上のことが可能となります。

# Usage
1. `.env.template` を `.env` という名前に変更し、内容を書き換えます。（author）
2. scripts/ 以下に ts ファイルを作成しプラグインを書きます。
3. rollup.config.js に作成したファイルを登録します。Object の key がプラグイン名になります。
4. `$ npm run build` を実行します。
