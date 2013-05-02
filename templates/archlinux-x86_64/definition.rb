root_password = 'veewee'

Veewee::Definition.declare({
  :cpu_count   => '1',
  :memory_size => '256',
  :disk_size   => '10140',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id  => 'ArchLinux_64',
  :iso_file    => 'archlinux-2013.04.01-dual.iso',
  :iso_src     => 'http://archlinux.mirror.kangaroot.net/iso/2013.04.01/archlinux-2013.04.01-dual.iso',
  :iso_md5     => '0758f72d88a088cc4f6174f50ff354fd',
  :iso_download_timeout => '1000',
  :boot_wait   => '5',
  :boot_cmd_sequence => [
    '<Enter>',
    '<Wait>' * 30,
    'echo "sshd: ALL" > /etc/hosts.allow<Enter>',
    'passwd<Enter>',
    "#{root_password}<Enter>",
    "#{root_password}<Enter>",
    'systemctl start sshd.service<Enter><Wait>',
  ],
  :ssh_login_timeout => '10000',
  :ssh_user          => 'root',
  :ssh_password      => "#{root_password}",
  :ssh_key           => '',
  :ssh_host_port     => '7222',
  :ssh_guest_port    => '22',
  :sudo_cmd          => "sh '%f'",
  :shutdown_cmd      => 'shutdown -h now',
  :postinstall_files => [
    'postinstall.sh',
    'postinstall2.sh',
  ],
  :postinstall_timeout => '10000'
})
