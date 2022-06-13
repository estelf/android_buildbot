# android_buildbot
renoir用LOS自動ビルドスクリプトです。デバイス名やrom名を変えればほかのものでも使えると思います。  
## 使い方  
詳しい環境設定はLOSのビルドガイドを参考に[Build guides](https://wiki.lineageos.org/build_guides)  
~/android内にプロプライエタリbrob抽出用のOTAパッケージ"payload.bin"とloacl_manifests/codename.xmlを配置
making_LOS.shを実行することでsyncからプロプライエタリbrob抽出ビルドまで行われます。  
release_system_dump.shは抽出ファイルのアンマウントと削除をします。  
## 最後に
自環境では一部beacon errorが出てしまいビルドには至りませんでした。(´・ω・`)
