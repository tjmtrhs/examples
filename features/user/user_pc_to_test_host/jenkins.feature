@static
Feature: 社内テスト環境サーバの Web コンソールでテスト実施

  開発者として、
  社内テスト環境サーバの Web コンソールにアクセスしたい
  なぜならテスト環境でのテスト実施や確認を行う必要があるから

  Scenario: 社内テスト環境サーバ Web コンソールへアクセス
    Given 社内 PC
    And 社内のテスト環境サーバ
    When 社内 PC にログイン
    And Web ブラウザで社内のテスト環境サーバの Web コンソールにアクセス
    Then アクセス成功
