# coding: utf-8
# frozen_string_literal: true

# tester setは１箇所定義にしたいのでこうしている
require File.expand_path("../support/tester_sets.rb", __FILE__)

FactoryGirl.define do

  sequence :virtual_port_number, 2

  trait :internal_network_host do
    tester_set tester_sets[:note]
    netmask '255.255.255.0'
    gateway '10.10.10.254'
    virtual_port_number
  end

  factory :git_host, class: NetTester::Netns do
    name 'git_host'
    internal_network_host
    ip_address '10.10.10.1'
    physical_port_number 6
    vlan_id 2025
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :test_host, class: NetTester::Netns do
    name 'test_host'
    internal_network_host
    ip_address '10.10.10.2'
    physical_port_number 4
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :user_pc, class: NetTester::Netns do
    name 'user_pc'
    internal_network_host
    ip_address '10.10.10.4'
    physical_port_number 8
    mac_address {Faker::Internet.mac_address('00')}
  end

  trait :dmz_network do
    tester_set tester_sets[:note]
    netmask '255.255.255.0'
    gateway '10.10.0.1'
    virtual_port_number
  end

  factory :dmz_host, class: NetTester::Netns do
    name 'dmz_host'
    dmz_network
    ip_address '10.10.0.100'
    physical_port_number 10
    vlan_id 2023
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :dns_host, class: NetTester::Netns do
    name 'dns_host'
    dmz_network
    ip_address '10.10.0.10'
    physical_port_number 5
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :vpn_host, class: NetTester::Netns do
    name 'vpn_host'
    dmz_network
    ip_address '10.10.0.11'
    physical_port_number 10
    vlan_id 2023
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :vpn_address_pool, class: NetTester::Netns do
    name 'vpn_addrpool'
    dmz_network
    ip_address '10.10.0.130'
    physical_port_number 10
    vlan_id 2023
    mac_address {Faker::Internet.mac_address('00')}
  end

  trait :internet_network do
    tester_set tester_sets[:note]
    netmask '255.255.255.0'
    gateway '198.51.100.254'
    virtual_port_number
  end

  factory :internet_pc, class: NetTester::Netns do
    name 'internet_pc'
    internet_network
    ip_address '198.51.100.1'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :internet_dns_host, class: NetTester::Netns do
    name 'internet_dns'
    internet_network
    ip_address '198.51.100.2'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :internet_host, class: NetTester::Netns do
    name 'internet_svr'
    internet_network
    ip_address '198.51.100.3'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :internet_ntp_host, class: NetTester::Netns do
    name 'internet_ntp'
    internet_network
    ip_address '198.51.100.4'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :tajimax_pc, class: NetTester::Netns do
    name 'tajimax_pc'
    internet_network
    ip_address '198.51.100.94'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end

  trait :note do
    tester_set_name 'note'
    tester_set tester_sets['note'][:ip_address]
    netmask '255.255.255.0'
    virtual_port_number
    gateway '198.51.100.254'
  end

  factory :note1_host, class: NetTester::Netns do
    name 'note1_host'
    note
    ip_address '198.51.100.10'
    physical_port_number 2
    mac_address '00:00:5e:00:53:01'
  end

  factory :note2_host, class: NetTester::Netns do
    name 'note2_host'
    note
    ip_address '198.51.100.11'
    physical_port_number 3
    mac_address '00:00:5e:00:53:02'
  end

  trait :tama do
    tester_set_name 'tama'
    tester_set tester_sets['tama'][:ip_address]
    netmask '255.255.255.0'
    virtual_port_number
    gateway '198.51.100.254'
  end

  factory :tama1_host, class: NetTester::Netns do
    name 'tama1_host'
    tama
    ip_address '198.51.100.20'
    physical_port_number 3
    mac_address '00:00:5e:00:53:03'
  end

  factory :tama2_host, class: NetTester::Netns do
    name 'tama2_host'
    tama
    ip_address '198.51.100.21'
    physical_port_number 2
    mac_address '00:00:5e:00:53:04'
  end
end
