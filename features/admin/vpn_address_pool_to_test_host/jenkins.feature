@static_topology
Feature: 社内テスト環境の Web コンソールへの接続確認

  ネットワーク管理者として、
  DMZ の VPN アドレスプールからテスト環境サーバの Web コンソールへの接続確認をしたい
  なぜなら開発業務でタジマックス社の開発者がテスト環境 Web コンソールにアクセスするから

  Scenario: 社内テストサーバ Web コンソールへアクセス
    Given DMZ の VPN アドレスプール
    And 社内のテスト環境サーバ
    When DMZ の VPN アドレスプールにログイン
    And Web ブラウザで社内のテスト環境サーバの Web コンソールにアクセス
    Then アクセス成功
