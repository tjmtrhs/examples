@dynamic
Feature: リモート開発環境への安定したアクセス
  タジマックス社の社員として
  ヨーヨーダイン社内の開発環境に安定してアクセスしたい
  なぜならリモート作業を日常的に行うから

  Scenario: リンク障害発生でもリモート接続が切れない
    Given VPN サーバ
    And タジマックス社の PC を VPN クライアントに
    And ヨーヨーダイン社のサーバに VPN 経由でリモートアクセスして作業
    When FW1 と L2SWEX 間にリンク障害が発生
    Then リモート接続が切れていない

  Scenario: リンク障害回復でもリモート接続が切れない
    Given VPN サーバ
    And タジマックス社の PC を VPN クライアントに
    And ヨーヨーダイン社のサーバに VPN 経由でリモートアクセスして作業
    When FW1 と L2SWEX 間のリンク障害が回復
    Then リモート接続に影響がない
