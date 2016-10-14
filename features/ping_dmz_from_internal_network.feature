Feature: ヨーヨーダイン社内部からヨーヨーダイン社のDMZ内のサーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部からヨーヨーダイン社のDMZ内のサーバへの疎通確認をしたい
  なぜならヨーヨーダイン社の開発者はDMZ上のサーバにアクセスする必要があるから

  Scenario: ヨーヨーダイン社内部からDMZへの疎通確認
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内部のサーバ
    When DMZにヨーヨーダイン社のPCからpingで疎通確認
    Then pingで疎通成功
