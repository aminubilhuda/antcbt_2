
/*---------------------------------------------------------------
  SQL DB BACKUP 05.06.2020 22:15 
  HOST: localhost
  DATABASE: ecandy28r1
  TABLES: *
  ---------------------------------------------------------------*/

/*---------------------------------------------------------------
  TABLE: `berita`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `berita`;
CREATE TABLE `berita` (
  `id_berita` int(10) NOT NULL AUTO_INCREMENT,
  `id_mapel` int(10) NOT NULL,
  `sesi` varchar(10) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `ikut` varchar(10) DEFAULT NULL,
  `susulan` varchar(10) DEFAULT NULL,
  `no_susulan` text DEFAULT NULL,
  `mulai` varchar(10) DEFAULT NULL,
  `selesai` varchar(10) DEFAULT NULL,
  `nama_proktor` varchar(50) DEFAULT NULL,
  `nip_proktor` varchar(50) DEFAULT NULL,
  `nama_pengawas` varchar(50) DEFAULT NULL,
  `nip_pengawas` varchar(50) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tgl_ujian` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_berita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*---------------------------------------------------------------
  TABLE: `file_pendukung`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `file_pendukung`;
CREATE TABLE `file_pendukung` (
  `id_file` int(11) NOT NULL AUTO_INCREMENT,
  `id_mapel` int(11) DEFAULT 0,
  `nama_file` varchar(50) DEFAULT NULL,
  `status_file` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;

/*---------------------------------------------------------------
  TABLE: `jawaban`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `jawaban`;
CREATE TABLE `jawaban` (
  `id_jawaban` int(11) NOT NULL AUTO_INCREMENT,
  `id_siswa` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `jawaban` char(1) DEFAULT NULL,
  `jawabx` char(1) DEFAULT NULL,
  `jenis` int(1) NOT NULL,
  `esai` text DEFAULT NULL,
  `nilai_esai` int(5) NOT NULL DEFAULT 0,
  `ragu` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jawaban`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*---------------------------------------------------------------
  TABLE: `jawaban_tugas`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `jawaban_tugas`;
CREATE TABLE `jawaban_tugas` (
  `id_jawaban` int(11) NOT NULL AUTO_INCREMENT,
  `id_siswa` int(11) DEFAULT NULL,
  `id_tugas` int(11) DEFAULT NULL,
  `jawaban` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_dikerjakan` datetime DEFAULT NULL,
  `tgl_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nilai` varchar(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_jawaban`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*---------------------------------------------------------------
  TABLE: `jenis`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `jenis`;
CREATE TABLE `jenis` (
  `id_jenis` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `jenis` VALUES   ('PTS','Penilaian Tengah Semester','aktif');
INSERT INTO `jenis` VALUES ('USBK','Ujian Sekolah','tidak');

/*---------------------------------------------------------------
  TABLE: `jurusan`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan` (
  `jurusan_id` varchar(25) NOT NULL,
  `nama_jurusan_sp` varchar(100) DEFAULT NULL,
  `kurikulum` varchar(120) DEFAULT NULL,
  `jurusan_sp_id` varchar(50) DEFAULT NULL,
  `kurikulum_id` varchar(20) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jurusan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*---------------------------------------------------------------
  TABLE: `kelas`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas` (
  `id_kelas` varchar(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `kelas` VALUES   ('XIITKJ','XII','XIITKJ',NULL,NULL);
INSERT INTO `kelas` VALUES ('XIITKR','XII','XIITKR',NULL,NULL);
INSERT INTO `kelas` VALUES ('XIITP','XII','XIITP',NULL,NULL);
INSERT INTO `kelas` VALUES ('XITKJA','XI','XITKJA',NULL,NULL);
INSERT INTO `kelas` VALUES ('XITKJB','XI','XITKJB',NULL,NULL);
INSERT INTO `kelas` VALUES ('XITKJC','XI','XITKJC',NULL,NULL);
INSERT INTO `kelas` VALUES ('XITKRA','XI','XITKRA',NULL,NULL);
INSERT INTO `kelas` VALUES ('XITKRB','XI','XITKRB',NULL,NULL);
INSERT INTO `kelas` VALUES ('XITPA','XI','XITPA',NULL,NULL);
INSERT INTO `kelas` VALUES ('XITPB','XI','XITPB',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTKJA','X','XTKJA',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTKJB','X','XTKJB',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTKJC','X','XTKJC',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTKJD','X','XTKJD',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTKRA','X','XTKRA',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTKRB','X','XTKRB',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTKRC','X','XTKRC',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTPA','X','XTPA',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTPB','X','XTPB',NULL,NULL);
INSERT INTO `kelas` VALUES ('XTPC','X','XTPC',NULL,NULL);

/*---------------------------------------------------------------
  TABLE: `level`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `kode_level` varchar(5) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `level` VALUES   ('X','X',NULL);
INSERT INTO `level` VALUES ('XI','XI',NULL);
INSERT INTO `level` VALUES ('XII','XII',NULL);

/*---------------------------------------------------------------
  TABLE: `log`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_siswa` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `text` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
INSERT INTO `log` VALUES   ('1','3','login','masuk','2020-04-12 07:58:45');
INSERT INTO `log` VALUES ('2','3','testongoing','sedang ujian','2020-04-12 07:58:56');
INSERT INTO `log` VALUES ('3','3','login','Selesai Ujian','2020-04-12 08:00:07');
INSERT INTO `log` VALUES ('4','3','testongoing','sedang ujian','2020-04-12 08:00:35');
INSERT INTO `log` VALUES ('5','3','login','Selesai Ujian','2020-04-12 08:03:43');
INSERT INTO `log` VALUES ('6','3','login','Selesai Ujian','2020-04-12 08:03:43');
INSERT INTO `log` VALUES ('7','3','login','Selesai Ujian','2020-04-12 08:03:43');
INSERT INTO `log` VALUES ('8','3','login','Selesai Ujian','2020-04-12 08:03:43');
INSERT INTO `log` VALUES ('9','3','login','Selesai Ujian','2020-04-12 08:03:43');
INSERT INTO `log` VALUES ('10','3','login','Selesai Ujian','2020-04-12 08:03:43');
INSERT INTO `log` VALUES ('11','3','login','Selesai Ujian','2020-04-12 08:03:43');
INSERT INTO `log` VALUES ('12','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('13','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('14','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('15','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('16','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('17','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('18','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('19','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('20','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('21','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('22','3','login','Selesai Ujian','2020-04-12 08:03:44');
INSERT INTO `log` VALUES ('23','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('24','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('25','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('26','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('27','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('28','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('29','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('30','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('31','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('32','3','login','Selesai Ujian','2020-04-12 08:03:45');
INSERT INTO `log` VALUES ('33','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('34','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('35','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('36','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('37','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('38','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('39','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('40','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('41','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('42','3','login','Selesai Ujian','2020-04-12 08:03:46');
INSERT INTO `log` VALUES ('43','3','login','Selesai Ujian','2020-04-12 08:03:47');
INSERT INTO `log` VALUES ('44','3','login','Selesai Ujian','2020-04-12 08:03:47');
INSERT INTO `log` VALUES ('45','3','login','Selesai Ujian','2020-04-12 08:03:47');
INSERT INTO `log` VALUES ('46','3','login','Selesai Ujian','2020-04-12 08:03:47');
INSERT INTO `log` VALUES ('47','3','login','Selesai Ujian','2020-04-12 08:03:47');
INSERT INTO `log` VALUES ('48','3','login','Selesai Ujian','2020-04-12 08:03:47');
INSERT INTO `log` VALUES ('49','3','login','Selesai Ujian','2020-04-12 08:03:47');
INSERT INTO `log` VALUES ('50','3','login','Selesai Ujian','2020-04-12 08:03:47');
INSERT INTO `log` VALUES ('51','3','login','Selesai Ujian','2020-04-12 08:03:47');
INSERT INTO `log` VALUES ('52','3','testongoing','sedang ujian','2020-04-12 08:05:34');
INSERT INTO `log` VALUES ('53','3','login','Selesai Ujian','2020-04-12 08:07:56');
INSERT INTO `log` VALUES ('54','4','login','masuk','2020-04-12 11:26:09');
INSERT INTO `log` VALUES ('55','4','testongoing','sedang ujian','2020-04-12 11:27:48');
INSERT INTO `log` VALUES ('56','4','logout','keluar','2020-04-12 11:28:07');
INSERT INTO `log` VALUES ('57','4','login','masuk','2020-04-12 11:28:16');
INSERT INTO `log` VALUES ('58','4','testongoing','sedang ujian','2020-04-12 11:28:22');
INSERT INTO `log` VALUES ('59','4','login','Selesai Ujian','2020-04-12 11:29:49');
INSERT INTO `log` VALUES ('60','4','login','Selesai Ujian','2020-04-12 11:30:26');
INSERT INTO `log` VALUES ('61','4','testongoing','sedang ujian','2020-04-12 11:36:46');
INSERT INTO `log` VALUES ('62','4','testongoing','sedang ujian','2020-04-12 11:37:06');
INSERT INTO `log` VALUES ('63','4','login','Selesai Ujian','2020-04-12 11:39:07');
INSERT INTO `log` VALUES ('64','4','login','Selesai Ujian','2020-04-12 11:39:18');
INSERT INTO `log` VALUES ('65','4','testongoing','sedang ujian','2020-04-12 11:39:56');
INSERT INTO `log` VALUES ('66','4','login','Selesai Ujian','2020-04-12 11:42:17');
INSERT INTO `log` VALUES ('67','309','login','masuk','2020-04-24 05:01:31');

/*---------------------------------------------------------------
  TABLE: `mapel`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `mapel`;
CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) NOT NULL DEFAULT '0',
  `idpk` varchar(255) NOT NULL,
  `idguru` varchar(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL DEFAULT 0,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL DEFAULT 0,
  `bobot_pg` int(5) NOT NULL,
  `bobot_esai` int(5) NOT NULL DEFAULT 0,
  `level` varchar(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(2) NOT NULL,
  `kkm` int(3) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
INSERT INTO `mapel` VALUES   ('1','MTK','a:1:{i:0;s:5:\"semua\";}','260','MATEMATIKA','60','0','60','0','100','0','semua','5','a:1:{i:0;s:5:\"semua\";}','2020-06-05 17:07:04','1','70','');

/*---------------------------------------------------------------
  TABLE: `mata_pelajaran`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `mata_pelajaran`;
CREATE TABLE `mata_pelajaran` (
  `kode_mapel` varchar(20) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `mata_pelajaran_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`kode_mapel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `mata_pelajaran` VALUES   ('MATEMATIKA','MATEMATIKA',NULL);

/*---------------------------------------------------------------
  TABLE: `materi`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `materi`;
CREATE TABLE `materi` (
  `id_materi` int(255) NOT NULL AUTO_INCREMENT,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `materi` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_materi`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
INSERT INTO `materi` VALUES   ('11','1','a:1:{i:0;s:5:\"semua\";}','MATEMATIKA','NEW CANDY 2.5','<p>candy 2.5</p>',NULL,'2020-04-24 21:00:00','','2020-04-24 21:35:10',NULL);
INSERT INTO `materi` VALUES ('12','1','a:1:{i:0;s:5:\"semua\";}','MATEMATIKA','Download VHD Candy Web Client','<p>yayayaya</p>',NULL,'2020-04-24 21:00:00','https://youtu.be/5s89dMDFn3I','2020-04-24 21:36:49',NULL);
INSERT INTO `materi` VALUES ('13','1','a:1:{i:0;s:5:\"semua\";}','MATEMATIKA','NEW CANDY 2.5','<p>teset</p>',NULL,'2020-04-24 21:00:00','https://youtu.be/5s89dMDFn3I','2020-04-24 21:42:48',NULL);

/*---------------------------------------------------------------
  TABLE: `nilai`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `nilai`;
CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `id_ujian` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kode_ujian` varchar(30) NOT NULL,
  `ujian_mulai` varchar(20) NOT NULL,
  `ujian_berlangsung` varchar(20) DEFAULT NULL,
  `ujian_selesai` varchar(20) DEFAULT NULL,
  `jml_benar` int(10) DEFAULT NULL,
  `jml_salah` int(10) DEFAULT NULL,
  `nilai_esai` varchar(10) DEFAULT NULL,
  `skor` varchar(10) DEFAULT NULL,
  `total` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `hasil` int(2) NOT NULL,
  `jawaban` text DEFAULT NULL,
  `jawaban_esai` longtext DEFAULT NULL,
  `nilai_esai2` text DEFAULT NULL,
  `online` int(1) NOT NULL DEFAULT 0,
  `id_soal` longtext DEFAULT NULL,
  `id_opsi` longtext DEFAULT NULL,
  `id_esai` text DEFAULT NULL,
  `blok` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_nilai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*---------------------------------------------------------------
  TABLE: `pengawas`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `pengawas`;
CREATE TABLE `pengawas` (
  `id_pengawas` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `rt_rw` varchar(8) DEFAULT NULL,
  `dusun` varchar(50) DEFAULT NULL,
  `kelurahan` varchar(50) DEFAULT NULL,
  `kecamatan` varchar(30) DEFAULT NULL,
  `kode_pos` int(6) DEFAULT NULL,
  `nuptk` varchar(20) DEFAULT NULL,
  `bidang_studi` varchar(50) DEFAULT NULL,
  `jenis_ptk` varchar(50) DEFAULT NULL,
  `tgs_tambahan` varchar(50) DEFAULT NULL,
  `status_pegawai` varchar(50) DEFAULT NULL,
  `status_aktif` varchar(20) DEFAULT NULL,
  `status_nikah` varchar(20) DEFAULT NULL,
  `sumber_gaji` varchar(30) DEFAULT NULL,
  `ahli_lab` varchar(10) DEFAULT NULL,
  `nama_ibu` varchar(40) DEFAULT NULL,
  `nama_suami` varchar(50) DEFAULT NULL,
  `nik_suami` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(20) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `keahlian_isyarat` varchar(10) DEFAULT NULL,
  `kewarganegaraan` varchar(10) DEFAULT NULL,
  `npwp` varchar(16) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `ptk_id` varchar(50) DEFAULT NULL,
  `password2` text DEFAULT NULL,
  `ruang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pengawas`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8;
INSERT INTO `pengawas` VALUES   ('1','-','administrator','','admin','$2y$10$q3VPw./.em0XI1U8mveKq.PQI4.3Z.cXCxL08RJkuRklGNWTfVut6','admin','','','0000-00-00','','','','','','','','','','0','','','','','','','','','','','','','','0000-00-00','','','','',NULL,NULL,NULL);
INSERT INTO `pengawas` VALUES ('260','-','PAJAR SIDIK',NULL,'guru','123','guru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*---------------------------------------------------------------
  TABLE: `pengumuman`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `pengumuman`;
CREATE TABLE `pengumuman` (
  `id_pengumuman` int(5) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `user` int(3) NOT NULL,
  `text` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_pengumuman`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
INSERT INTO `pengumuman` VALUES   ('8','eksternal','INFO JADWAL UJIAN','1','<p>Untuk ujian sekolah dilakukan secara daring atau online menggunakan Hp Android, PC, Laptop. Aplikasi ujian diakses dengan browser Google Chrome.</p>','2020-04-04 22:23:29');

/*---------------------------------------------------------------
  TABLE: `pk`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `pk`;
CREATE TABLE `pk` (
  `id_pk` varchar(10) NOT NULL,
  `program_keahlian` varchar(50) NOT NULL,
  `jurusan_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `pk` VALUES   ('TP','TP',NULL);

/*---------------------------------------------------------------
  TABLE: `referensi_jurusan`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `referensi_jurusan`;
CREATE TABLE `referensi_jurusan` (
  `jurusan_id` varchar(10) NOT NULL,
  `nama_jurusan` varchar(100) DEFAULT NULL,
  `untuk_sma` int(1) NOT NULL,
  `untuk_smk` int(1) NOT NULL,
  `jenjang_pendidikan_id` int(1) DEFAULT NULL,
  PRIMARY KEY (`jurusan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*---------------------------------------------------------------
  TABLE: `ruang`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `ruang`;
CREATE TABLE `ruang` (
  `kode_ruang` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  PRIMARY KEY (`kode_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `ruang` VALUES   ('R1','R1');
INSERT INTO `ruang` VALUES ('TKJ','TKJ');
INSERT INTO `ruang` VALUES ('TKR','TKR');
INSERT INTO `ruang` VALUES ('TP','TP');

/*---------------------------------------------------------------
  TABLE: `savsoft_options`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `savsoft_options`;
CREATE TABLE `savsoft_options` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `q_option` text NOT NULL,
  `q_option_match` varchar(1000) DEFAULT NULL,
  `score` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*---------------------------------------------------------------
  TABLE: `savsoft_qbank`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `savsoft_qbank`;
CREATE TABLE `savsoft_qbank` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `question_type` varchar(100) NOT NULL DEFAULT 'Multiple Choice Single Answer',
  `question` text NOT NULL,
  `description` text NOT NULL,
  `cid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `no_time_served` int(11) NOT NULL DEFAULT 0,
  `no_time_corrected` int(11) NOT NULL DEFAULT 0,
  `no_time_incorrected` int(11) NOT NULL DEFAULT 0,
  `no_time_unattempted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*---------------------------------------------------------------
  TABLE: `semester`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `semester_id` varchar(5) NOT NULL,
  `tahun_ajaran_id` varchar(4) NOT NULL,
  `nama_semester` varchar(50) NOT NULL,
  `semester` int(1) NOT NULL,
  `periode_aktif` enum('1','0') NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*---------------------------------------------------------------
  TABLE: `server`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `kode_server` varchar(20) NOT NULL,
  `nama_server` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `server` VALUES   ('SR02','SR02','aktif');

/*---------------------------------------------------------------
  TABLE: `sesi`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `sesi`;
CREATE TABLE `sesi` (
  `kode_sesi` varchar(10) NOT NULL,
  `nama_sesi` varchar(30) NOT NULL,
  PRIMARY KEY (`kode_sesi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `sesi` VALUES   ('1','1');

/*---------------------------------------------------------------
  TABLE: `session`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_time` varchar(10) NOT NULL,
  `session_hash` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*---------------------------------------------------------------
  TABLE: `setting`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL AUTO_INCREMENT,
  `aplikasi` varchar(100) DEFAULT NULL,
  `kode_sekolah` varchar(10) DEFAULT NULL,
  `sekolah` varchar(50) DEFAULT NULL,
  `jenjang` varchar(5) DEFAULT NULL,
  `kepsek` varchar(50) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `header` text DEFAULT NULL,
  `header_kartu` text DEFAULT NULL,
  `nama_ujian` text DEFAULT NULL,
  `versi` varchar(10) DEFAULT NULL,
  `ip_server` varchar(100) DEFAULT NULL,
  `waktu` varchar(50) DEFAULT NULL,
  `server` varchar(50) DEFAULT NULL,
  `id_server` varchar(50) DEFAULT NULL,
  `url_host` varchar(50) DEFAULT NULL,
  `token_api` varchar(50) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  `npsn` varchar(10) DEFAULT NULL,
  `db_versi` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_setting`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
INSERT INTO `setting` VALUES   ('1','X-Candy','K0248','CANDY SCHOOL','SD','CANDY SCHOOL','-','Perum BSD <br />\r\n','Karang Bahagia                                    ','Bekasi','021 123 123 123','021 95878050','candycbt.sch.id','candycbt@gmail.com','dist/img/logo82.png','','KARTU PESERTA','Penilaian Tengah Semester','2.5','http://192.168.0.200/candycbt','Asia/Jakarta','pusat','SR01','ujian.smkhsagung.sch.id','lJZTzzmJrmQcYZ','8cce47df-aae7-4274-83cb-5af3093eab56','69787351','2.8.1');

/*---------------------------------------------------------------
  TABLE: `sinkron`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `sinkron`;
CREATE TABLE `sinkron` (
  `nama_data` varchar(50) NOT NULL,
  `data` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `status_sinkron` int(11) DEFAULT NULL,
  PRIMARY KEY (`nama_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `sinkron` VALUES   ('DATA1','siswa','629','2020-04-24 22:10:22','1');
INSERT INTO `sinkron` VALUES ('DATA2','bank soal','','','0');
INSERT INTO `sinkron` VALUES ('DATA3','soal','','','0');
INSERT INTO `sinkron` VALUES ('DATA4','jadwal','','','0');

/*---------------------------------------------------------------
  TABLE: `siswa`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelas` varchar(11) DEFAULT NULL,
  `idpk` varchar(10) DEFAULT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `no_peserta` varchar(30) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `level` varchar(5) DEFAULT NULL,
  `ruang` varchar(10) DEFAULT NULL,
  `sesi` int(2) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `kebutuhan_khusus` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kode_pos` int(10) DEFAULT NULL,
  `jenis_tinggal` varchar(100) DEFAULT NULL,
  `alat_transportasi` varchar(100) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `skhun` int(11) DEFAULT NULL,
  `no_kps` varchar(50) DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `tahun_lahir_ayah` int(4) DEFAULT NULL,
  `pendidikan_ayah` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(100) DEFAULT NULL,
  `penghasilan_ayah` varchar(100) DEFAULT NULL,
  `nohp_ayah` varchar(15) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `tahun_lahir_ibu` int(4) DEFAULT NULL,
  `pendidikan_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(100) DEFAULT NULL,
  `penghasilan_ibu` varchar(100) DEFAULT NULL,
  `nohp_ibu` int(15) DEFAULT NULL,
  `nama_wali` varchar(150) DEFAULT NULL,
  `tahun_lahir_wali` int(4) DEFAULT NULL,
  `pendidikan_wali` varchar(50) DEFAULT NULL,
  `pekerjaan_wali` varchar(100) DEFAULT NULL,
  `penghasilan_wali` varchar(50) DEFAULT NULL,
  `angkatan` int(5) DEFAULT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `peserta_didik_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `online` int(1) DEFAULT 0,
  PRIMARY KEY (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=634 DEFAULT CHARSET=latin1;
INSERT INTO `siswa` VALUES   ('2','XIITP','TP','171810003','171810003','AHMAD SURIKI','XII','TP','1','K0212024800534','060702','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('3','XIITP','TP','171810004','171810004','AHMAD YANI','XII','TP','1','K0212024800543','230302','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('4','XIITP','TP','171810005','171810005','AKBAR DALAS RAMADHAN','XII','TP','1','K0212024800552','241102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('5','XIITP','TP','171810006','171810006','ALDI ALFIAN ','XII','TP','1','K0212024800569','140803','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('6','XIITP','TP','171810007','171810007','ANGGANI','XII','TP','1','K0212024800578','081002','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('7','XIITP','TP','171810009','171810009','ARYA PUTRA PAMUNGKAS','XII','TP','1','K0212024800587','190502','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('8','XIITP','TP','171810010','171810010','BAGUS PRIBADI','XII','TP','1','K0212024800596','030802','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('9','XIITP','TP','171810011','171810011','BAYU MARUTO','XII','TP','1','K0212024800605','300302','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('10','XIITP','TP','171810012','171810012','DARMA KESUMA JAYA','XII','TP','1','K0212024800614','291102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('11','XIITP','TP','171810013','171810013','DIKI PURNOMO SAPUTRA','XII','TP','1','K0212024800623','270802','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('12','XIITP','TP','171810014','171810014','DIKI RAMADHAN','XII','TP','1','K0212024800632','231101','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('13','XIITP','TP','171810015','171810015','DWIKI DARMAWAN','XII','TP','1','K0212024800649','140702','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('14','XIITP','TP','171810016','171810016','FIKIH RIZKI','XII','TP','1','K0212024800658','260401','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('15','XIITP','TP','171810018','171810018','HERI SAPUTRA','XII','TP','1','K0212024800667','260403','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('16','XIITP','TP','171810019','171810019','HERUDIN','XII','TP','1','K0212024800676','010801','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('17','XIITP','TP','171810020','171810020','IMAM HANAFI','XII','TP','1','K0212024800685','060103','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('18','XIITP','TP','171810021','171810021','INDRA NUR SEJATI','XII','TP','1','K0212024800694','070801','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('19','XIITP','TP','171810022','171810022','JAKARIA','XII','TP','1','K0212024800703','020403','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('20','XIITP','TP','171810023','171810023','JENAL','XII','TP','1','K0212024800712','150402','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('21','XIITP','TP','171810024','171810024','JULIAN SYAPUTRA ILBAS','XII','TP','1','K0212024800729','300701','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('22','XIITP','TP','171810026','171810026','MUHAMMAD REZA ','XII','TP','1','K0212024800738','080203','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('23','XIITP','TP','171810027','171810027','PRAMUDIKA YUDA HERMAWAN','XII','TP','1','K0212024800747','200902','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('24','XIITP','TP','171810029','171810029','RUKMA PERWIRA','XII','TP','1','K0212024800756','270402','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('25','XIITP','TP','171810030','171810030','SAIFUL RAMADHAN','XII','TP','1','K0212024800765','291102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('26','XIITP','TP','171810031','171810031','SARIPUDIN','XII','TP','1','K0212024800774','200602','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('27','XIITP','TP','171810032','171810032','USMAN SUMANTRI','XII','TP','1','K0212024800783','150702','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('28','XIITP','TP','171810033','171810033','WIJAYA SAPUTRA','XII','TP','1','K0212024800792','160802','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('29','XIITKR','TKR','171810034','171810034','AGGI SAPUTRA','XII','TKR','1','K0212024800018','060402','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('30','XIITKR','TKR','171810037','171810037','ANTON SAPUTRA','XII','TKR','1','K0212024800027','130402','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('31','XIITKR','TKR','171810039','171810039','ERWIN WIDIANSYAH','XII','TKR','1','K0212024800036','020603','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('32','XIITKR','TKR','171810040','171810040','FAILHAM HANAFI','XII','TKR','1','K0212024800045','270502','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('33','XIITKR','TKR','171810041','171810041','GUNAWAN MAOLANA PUTRA','XII','TKR','1','K0212024800054','030902','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('34','XIITKR','TKR','171810042','171810042','HAFIZ FATURROHMAN','XII','TKR','1','K0212024800063','220702','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('35','XIITKR','TKR','171810043','171810043','JAYA LAKSANA','XII','TKR','1','K0212024800072','221201','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('36','XIITKR','TKR','171810044','171810044','JEKI SAPUTRA','XII','TKR','1','K0212024800089','060401','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('37','XIITKR','TKR','171810045','171810045','MAHENDRA WIJAYA','XII','TKR','1','K0212024800098','060403','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('38','XIITKR','TKR','171810046','171810046','MUHAMAD RIVAN','XII','TKR','1','K0212024800125','140501','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('39','XIITKR','TKR','171810047','171810047','MUHAMAD YUSUP','XII','TKR','1','K0212024800134','180703','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('40','XIITKR','TKR','171810048','171810048','MUHAMMAD REZA SYAH VAHLEVI','XII','TKR','1','K0212024800116','030403','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('41','XIITKR','TKR','171810049','171810049','MUHAMMAD SAHLAN','XII','TKR','1','K0212024800143','280902','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('42','XIITKR','TKR','171810051','171810051','MULYANA YUSUP','XII','TKR','1','K0212024800152','140501','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('43','XIITKR','TKR','171810052','171810052','RAHMAT HIDAYAT','XII','TKR','1','K0212024800169','120103','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('44','XIITKR','TKR','171810053','171810053','SAM AMINUDIN','XII','TKR','1','K0212024800187','261001','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('45','XIITKR','TKR','171810054','171810054','SAMSUL BAHRI','XII','TKR','1','K0212024800196','011001','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('46','XIITKR','TKR','171810055','171810055','SUPARDI','XII','TKR','1','K0212024800205','010501','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('47','XIITKR','TKR','171810056','171810056','SYAWALUDDIN PRATAMA PUTRA','XII','TKR','1','K0212024800214','221201','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('48','XIITKR','TKR','171810057','171810057','TEGUH SUTRISNA','XII','TKR','1','K0212024800223','180802','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('49','XIITKR','TKR','171810058','171810058','TOMI','XII','TKR','1','K0212024800232','170701','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('50','XIITKR','TKR','171810059','171810059','WILDAN SYAHPUTRA','XII','TKR','1','K0212024800249','041102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('51','XIITKR','TKR','171810060','171810060','YOGA ADITAMA','XII','TKR','1','K0212024800258','220602','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('52','XIITKJ','TKJ','171810061','171810061','ADELANI RIZKY FAUZI','XII','TKJ','1','K0212024800267','220502','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('53','XIITKJ','TKJ','171810062','171810062','AMILIA PUTRI','XII','TKJ','1','K0212024800285','160102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('54','XIITKJ','TKJ','171810063','171810063','AMELIA PUTRI','XII','TKJ','1','K0212024800276','010702','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('55','XIITKJ','TKJ','171810064','171810064','ANDI','XII','TKJ','1','K0212024800294','101002','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('56','XIITKJ','TKJ','171810065','171810065','DEWI SUSILOWATI NINGSIH','XII','TKJ','1','K0212024800303','270702','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('57','XIITKJ','TKJ','171810066','171810066','FARHAN RAMDHANI','XII','TKJ','1','K0212024800329','161200','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('58','XIITKJ','TKJ','171810067','171810067','FITRI WULANDARI','XII','TKJ','1','K0212024800338','080202','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('59','XIITKJ','TKJ','171810068','171810068','FITRIA ANGRAENI','XII','TKJ','1','K0212024800347','131102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('60','XIITKJ','TKJ','171810070','171810070','INTAN NUR AENI','XII','TKJ','1','K0212024800374','230702','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('61','XIITKJ','TKJ','171810072','171810072','KIKI RAHMAT','XII','TKJ','1','K0212024800383','100902','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('62','XIITKJ','TKJ','171810073','171810073','MUHAMAD VICKY MAULANA','XII','TKJ','1','K0212024800409','260502','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('63','XIITKJ','TKJ','171810074','171810074','NABILAH','XII','TKJ','1','K0212024800418','160702','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('64','XIITKJ','TKJ','171810075','171810075','NILAS SUSILAWATI','XII','TKJ','1','K0212024800427','280403','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('65','XIITKJ','TKJ','171810076','171810076','NUR LAILA HUSNA','XII','TKJ','1','K0212024800436','201201','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('66','XIITKJ','TKJ','171810077','171810077','PUZI ASTUTI','XII','TKJ','1','K0212024800454','230202','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('67','XIITKJ','TKJ','171810078','171810078','PUTRI OKTAVIANI','XII','TKJ','1','K0212024800445','100501','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('68','XIITKJ','TKJ','171810079','171810079','RIANI TRI HAPSARI','XII','TKJ','1','K0212024800472','150502','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('69','XIITKJ','TKJ','171810080','171810080','SINDI YANI','XII','TKJ','1','K0212024800489','110902','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('70','XIITKJ','TKJ','171810081','171810081','SINTA BELA B','XII','TKJ','1','K0212024800498','031001','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('71','XIITKJ','TKJ','171810082','171810082','YANTI PRIHATINI','XII','TKJ','1','K0212024800516','230202','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('72','XIITKR','TKR','171810083','171810083','RICKI BAHTIAR','XII','TKR','1','K0212024800178','180102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('73','XIITKJ','TKJ','171810085','171810085','RATNA TRIANA PUSPITA','XII','TKJ','1','K0212024800463','290702','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('74','XIITKJ','TKJ','171810086','171810086','GUNAWAN ADRIANSYAH','XII','TKJ','1','K0212024800356','260502','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('75','XIITKJ','TKJ','171810090','171810090','DWI PUSPA MAHARANI','XII','TKJ','1','K0212024800312','291202','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('76','XIITKJ','TKJ','171810091','171810091','HAIDAR ALI SIBAGUS HIDAYAT','XII','TKJ','1','K0212024800365','210202','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('77','XIITKR','TKR','171810092','171810092','MAULANA SYAHRI ROMADON','XII','TKR','1','K0212024800107','131201','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('78','XIITKJ','TKJ','171810093','171810093','SITI ROBIATUL ADAWIYAH','XII','TKJ','1','K0212024800507','211201','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('79','XIITKJ','TKJ','171810094','171810094','LILA NOVILETA','XII','TKJ','1','K0212024800392','241102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('80','XITKJA','TKJ','181910001','181910001','ADELIA PUTRI','XI','R1','1','181910001','181910001','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('81','XITKJA','TKJ','181910002','181910002','ANI NURHAYATI','XI','R1','1','181910002','181910002','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('82','XITKJA','TKJ','181910003','181910003','ANIS MARCELIA','XI','R1','1','181910003','181910003','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('83','XITKJA','TKJ','181910004','181910004','ARIPAH','XI','R1','1','181910004','181910004','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('84','XITKJA','TKJ','181910005','181910005','AYU NURSAFITRI','XI','R1','1','181910005','181910005','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('85','XITKJA','TKJ','181910006','181910006','DAHLIA AMELIA','XI','R1','1','181910006','181910006','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('86','XITKJA','TKJ','181910007','181910007','DIANA LESTARI DEWI','XI','R1','1','181910007','181910007','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('87','XITKJA','TKJ','181910008','181910008','FAISAL HIDAYAT','XI','R1','1','181910008','181910008','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('88','XITKJA','TKJ','181910009','181910009','FAJAR MAULANA SIDIK','XI','R1','1','181910009','181910009','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('89','XITKJA','TKJ','181910010','181910010','HIDAYATULLOH','XI','R1','1','181910010','181910010','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('90','XITKJA','TKJ','181910011','181910011','HILMA HILATUL HASANAH','XI','R1','1','181910011','181910011','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('91','XITKJA','TKJ','181910012','181910012','IKAH PUSPITA SARI','XI','R1','1','181910012','181910012','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('92','XITKJA','TKJ','181910013','181910013','ISMA AYU AGUSTIN','XI','R1','1','181910013','181910013','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('93','XITKJA','TKJ','181910014','181910014','KARINA INDRIYANA','XI','R1','1','181910014','181910014','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('94','XITKJA','TKJ','181910015','181910015','KARTIKA ','XI','R1','1','181910015','181910015','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('95','XITKJA','TKJ','181910016','181910016','LUKMAN','XI','R1','1','181910016','181910016','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('96','XITKJA','TKJ','181910017','181910017','MAEMUNAH','XI','R1','1','181910017','181910017','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('97','XITKJA','TKJ','181910018','181910018','MARSINAH','XI','R1','1','181910018','181910018','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('98','XITKJA','TKJ','181910019','181910019','MELI UTAMI','XI','R1','1','181910019','181910019','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('99','XITKJA','TKJ','181910020','181910020','MUHAMAD IBROHIM SAPUTRA','XI','R1','1','181910020','181910020','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('100','XITKJA','TKJ','181910021','181910021','NADIAH SALAMAH','XI','R1','1','181910021','181910021','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('101','XITKJA','TKJ','181910022','181910022','NELLY NELLY SHA','XI','R1','1','181910022','181910022','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('102','XITKJA','TKJ','181910023','181910023','NON ITA JAYA','XI','R1','1','181910023','181910023','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('103','XITKJA','TKJ','181910024','181910024','NOVI','XI','R1','1','181910024','181910024','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('104','XITKJA','TKJ','181910025','181910025','NUR AZIZAH','XI','R1','1','181910025','181910025','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('105','XITKJA','TKJ','181910026','181910026','NURMALIA','XI','R1','1','181910026','181910026','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('106','XITKJA','TKJ','181910027','181910027','PAUSIAH EROS','XI','R1','1','181910027','181910027','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('107','XITKJA','TKJ','181910028','181910028','REFI MELLIA','XI','R1','1','181910028','181910028','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('108','XITKJA','TKJ','181910029','181910029','RIKA PUTRI PERTIWI','XI','R1','1','181910029','181910029','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('109','XITKJA','TKJ','181910030','181910030','SANDRINA MALAKIANO','XI','R1','1','181910030','181910030','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('110','XITKJA','TKJ','181910031','181910031','SELFI FEBRIYANTI','XI','R1','1','181910031','181910031','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('111','XITKJA','TKJ','181910032','181910032','SIMAH RAHMAWATI','XI','R1','1','181910032','181910032','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('112','XITKJA','TKJ','181910033','181910033','SINDI AGUSTIN','XI','R1','1','181910033','181910033','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('113','XITKJA','TKJ','181910034','181910034','SISKA','XI','R1','1','181910034','181910034','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('114','XITKJA','TKJ','181910036','181910036','YUNITA','XI','R1','1','181910036','181910036','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('115','XITKJB','TKJ','181910037','181910037','ALDA PERMADANI','XI','R1','1','181910037','181910037','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('116','XITKJB','TKJ','181910038','181910038','ALINA ARIANTI','XI','R1','1','181910038','181910038','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('117','XITKJB','TKJ','181910039','181910039','ANNISA SALSABILA','XI','R1','1','181910039','181910039','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('118','XITKJB','TKJ','181910040','181910040','CIKA ROSSINTA','XI','R1','1','181910040','181910040','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('119','XITKJB','TKJ','181910041','181910041','DHANDI APRISNA','XI','R1','1','181910041','181910041','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('120','XITKJB','TKJ','181910042','181910042','DINA NUR KHUMAIROH','XI','R1','1','181910042','181910042','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('121','XITKJB','TKJ','181910043','181910043','EKA DUWI AGUSTINA','XI','R1','1','181910043','181910043','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('122','XITKJB','TKJ','181910044','181910044','HANIFAH ISMAIL','XI','R1','1','181910044','181910044','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('123','XITKJB','TKJ','181910046','181910046','KARLIN','XI','R1','1','181910046','181910046','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('124','XITKJB','TKJ','181910047','181910047','KARLINAH','XI','R1','1','181910047','181910047','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('125','XITKJB','TKJ','181910048','181910048','LEDYANTI','XI','R1','1','181910048','181910048','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('126','XITKJB','TKJ','181910049','181910049','LESTI LISTIAWATI','XI','R1','1','181910049','181910049','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('127','XITKJB','TKJ','181910050','181910050','M ABDULLAH AZZAM','XI','R1','1','181910050','181910050','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('128','XITKJB','TKJ','181910051','181910051','MAIMUNAH','XI','R1','1','181910051','181910051','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('129','XITKJB','TKJ','181910052','181910052','MARIA ULFAH','XI','R1','1','181910052','181910052','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('130','XITKJB','TKJ','181910053','181910053','MAULANA ABDUL AZIS','XI','R1','1','181910053','181910053','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('131','XITKJB','TKJ','181910054','181910054','MULKOYAH SUKMA P','XI','R1','1','181910054','181910054','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('132','XITKJB','TKJ','181910055','181910055','NABILA SAFITRI','XI','R1','1','181910055','181910055','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('133','XITKJB','TKJ','181910056','181910056','NEVI SURYANENGSIH','XI','R1','1','181910056','181910056','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('134','XITKJB','TKJ','181910057','181910057','NINA ROSALINA','XI','R1','1','181910057','181910057','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('135','XITKJB','TKJ','181910058','181910058','NISSA AULIYA FITRI','XI','R1','1','181910058','181910058','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('136','XITKJB','TKJ','181910059','181910059','PUTRI AISAH SABILA','XI','R1','1','181910059','181910059','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('137','XITKJB','TKJ','181910060','181910060','PUTRI AMELIA','XI','R1','1','181910060','181910060','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('138','XITKJB','TKJ','181910061','181910061','RIANA OKTAVIANI','XI','R1','1','181910061','181910061','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('139','XITKJB','TKJ','181910062','181910062','SEPTYA NINGSIH','XI','R1','1','181910062','181910062','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('140','XITKJB','TKJ','181910063','181910063','SITI MASITOH','XI','R1','1','181910063','181910063','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('141','XITKJB','TKJ','181910064','181910064','SITI NAISYAH','XI','R1','1','181910064','181910064','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('142','XITKJB','TKJ','181910065','181910065','SUMARNI PRATIWI','XI','R1','1','181910065','181910065','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('143','XITKJB','TKJ','181910066','181910066','SYIFA AULIA RAHMADANI','XI','R1','1','181910066','181910066','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('144','XITKJC','TKJ','181910067','181910067','ADINDA PUTRI KOSASIH','XI','R1','1','181910067','181910067','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('145','XITKJC','TKJ','181910068','181910068','ANGGI PUSPITA SARI','XI','R1','1','181910068','181910068','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('146','XITKJC','TKJ','181910069','181910069','ANISA FITRI ','XI','R1','1','181910069','181910069','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('147','XITKJC','TKJ','181910070','181910070','ANISSAH','XI','R1','1','181910070','181910070','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('148','XITKJC','TKJ','181910071','181910071','ANITA RAHAYU','XI','R1','1','181910071','181910071','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('149','XITKJC','TKJ','181910072','181910072','CIKAL SEKAR PALUPI','XI','R1','1','181910072','181910072','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('150','XITKJC','TKJ','181910073','181910073','DESTYANA NURFADILAH','XI','R1','1','181910073','181910073','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('151','XITKJC','TKJ','181910074','181910074','ENCAH MARDILAH','XI','R1','1','181910074','181910074','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('152','XITKJC','TKJ','181910075','181910075','FITRIAH ROIDATUL AIS','XI','R1','1','181910075','181910075','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('153','XITKJC','TKJ','181910076','181910076','FLANDYLAN RUI','XI','R1','1','181910076','181910076','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('154','XITKJC','TKJ','181910077','181910077','IDA ROYANIH','XI','R1','1','181910077','181910077','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('155','XITKJC','TKJ','181910078','181910078','INTAN PUSPITA SARI','XI','R1','1','181910078','181910078','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('156','XITKJC','TKJ','181910079','181910079','IRAWATI DEWI','XI','R1','1','181910079','181910079','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('157','XITKJC','TKJ','181910080','181910080','MARLINAH','XI','R1','1','181910080','181910080','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('158','XITKJC','TKJ','181910081','181910081','MIRA PURNAMA','XI','R1','1','181910081','181910081','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('159','XITKJC','TKJ','181910082','181910082','NOVIE SARDI SAFITRI','XI','R1','1','181910082','181910082','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('160','XITKJC','TKJ','181910084','181910084','PUSPA PUSPITA','XI','R1','1','181910084','181910084','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('161','XITKJC','TKJ','181910085','181910085','PUTRI AMARWATI','XI','R1','1','181910085','181910085','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('162','XITKJC','TKJ','181910086','181910086','RENITA','XI','R1','1','181910086','181910086','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('163','XITKJC','TKJ','181910087','181910087','RIFDA NABILAH','XI','R1','1','181910087','181910087','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('164','XITKJC','TKJ','181910088','181910088','ROVYANSYAH','XI','R1','1','181910088','181910088','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('165','XITKJC','TKJ','181910089','181910089','SAFITRI YANI','XI','R1','1','181910089','181910089','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('166','XITKJC','TKJ','181910090','181910090','SELY','XI','R1','1','181910090','181910090','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('167','XITKJC','TKJ','181910091','181910091','SITI FATIMAH','XI','R1','1','181910091','181910091','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('168','XITKJC','TKJ','181910092','181910092','SITI KARMILAH','XI','R1','1','181910092','181910092','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('169','XITKJC','TKJ','181910093','181910093','SITI MASITOH','XI','R1','1','181910093','181910093','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('170','XITKJC','TKJ','181910094','181910094','SUSAN IRAWATI','XI','R1','1','181910094','181910094','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('171','XITKJC','TKJ','181910095','181910095','SYA\'DIYAH','XI','R1','1','181910095','181910095','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('172','XITKJC','TKJ','181910096','181910096','WIDIA','XI','R1','1','181910096','181910096','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('173','XITKJC','TKJ','181910098','181910098','YULIA STELLA ISTININGTYAS','XI','R1','1','181910098','181910098','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('174','XITKJC','TKJ','181910099','181910099','ZAHRA RAHMAYANTI','XI','R1','1','181910099','181910099','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('175','XITPA','TP','181910100','181910100','ADE GUNAWAN','XI','R1','1','181910100','181910100','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('176','XITPA','TP','181910101','181910101','ADITYA RAHMAT HIDAYAT','XI','R1','1','181910101','181910101','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('177','XITPA','TP','181910102','181910102','AGUNG SAPUTRA','XI','R1','1','181910102','181910102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('178','XITPA','TP','181910103','181910103','AHMED ZONATAN','XI','R1','1','181910103','181910103','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('179','XITPA','TP','181910104','181910104','ALWI SYIHAB','XI','R1','1','181910104','181910104','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('180','XITPA','TP','181910105','181910105','AMIR','XI','R1','1','181910105','181910105','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('181','XITPA','TP','181910106','181910106','ANDRI GUNAWAN','XI','R1','1','181910106','181910106','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('182','XITPA','TP','181910107','181910107','ARBA FAUZI HAKIM','XI','R1','1','181910107','181910107','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('183','XITPA','TP','181910108','181910108','ARMAN MAULANA','XI','R1','1','181910108','181910108','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('184','XITPA','TP','181910109','181910109','DA\'I SINDU YANTO','XI','R1','1','181910109','181910109','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('185','XITPA','TP','181910111','181910111','GURUH APRIYANA','XI','R1','1','181910111','181910111','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('186','XITPA','TP','181910112','181910112','JAKARIA ','XI','R1','1','181910112','181910112','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('187','XITPA','TP','181910113','181910113','LUCKY HERMANSAH','XI','R1','1','181910113','181910113','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('188','XITPA','TP','181910114','181910114','M ABDUL ADI YASIN','XI','R1','1','181910114','181910114','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('189','XITPA','TP','181910115','181910115','M HENDRIANSYAH','XI','R1','1','181910115','181910115','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('190','XITPA','TP','181910116','181910116','M SOLEHUDIN','XI','R1','1','181910116','181910116','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('191','XITPA','TP','181910117','181910117','M. BACHRUL ULUM','XI','R1','1','181910117','181910117','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('192','XITPA','TP','181910118','181910118','MAULANA INDRA KOMARA','XI','R1','1','181910118','181910118','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('193','XITPA','TP','181910119','181910119','MUHAMAD AL RIFQI','XI','R1','1','181910119','181910119','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('194','XITPA','TP','181910120','181910120','MUHAMAD RIDWAN','XI','R1','1','181910120','181910120','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('195','XITPA','TP','181910121','181910121','MUHAMAD YUNUS','XI','R1','1','181910121','181910121','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('196','XITPA','TP','181910122','181910122','NIKO DIANTURI','XI','R1','1','181910122','181910122','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('197','XITPA','TP','181910123','181910123','RAKA ANDIKA ','XI','R1','1','181910123','181910123','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('198','XITPA','TP','181910124','181910124','RAMDAN','XI','R1','1','181910124','181910124','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('199','XITPA','TP','181910125','181910125','RENDI ANDRIANSYAH','XI','R1','1','181910125','181910125','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('200','XITPA','TP','181910126','181910126','RIFKI ALFAREZ','XI','R1','1','181910126','181910126','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('201','XITPA','TP','181910127','181910127','ROBBY AL FAREZEL','XI','R1','1','181910127','181910127','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('202','XITPA','TP','181910128','181910128','RONI TRI','XI','R1','1','181910128','181910128','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('203','XITPA','TP','181910129','181910129','SARMAN','XI','R1','1','181910129','181910129','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('204','XITPA','TP','181910130','181910130','SHANTANU YAZI','XI','R1','1','181910130','181910130','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('205','XITPA','TP','181910131','181910131','SUHADI SUTRISNA','XI','R1','1','181910131','181910131','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('206','XITPA','TP','181910132','181910132','SUTRISNA','XI','R1','1','181910132','181910132','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('207','XITPA','TP','181910133','181910133','TOPAN SAEPUL B','XI','R1','1','181910133','181910133','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('208','XITPA','TP','181910134','181910134','UJANG AGUS','XI','R1','1','181910134','181910134','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('209','XITPA','TP','181910135','181910135','VERI HERMAWAN','XI','R1','1','181910135','181910135','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('210','XITPB','TP','181910136','181910136','ABDUL KARIM','XI','R1','1','181910136','181910136','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('211','XITPB','TP','181910137','181910137','ADBULAH ABDUL WAHAB','XI','R1','1','181910137','181910137','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('212','XITPB','TP','181910138','181910138','ACEP SUNANDAR','XI','R1','1','181910138','181910138','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('213','XITPB','TP','181910139','181910139','AGUNG RAHMAT','XI','R1','1','181910139','181910139','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('214','XITPB','TP','181910140','181910140','AGUNG SUHENDAR','XI','R1','1','181910140','181910140','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('215','XITPB','TP','181910141','181910141','AHMAD FERY','XI','R1','1','181910141','181910141','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('216','XITPB','TP','181910142','181910142','AHMAD KHAFI','XI','R1','1','181910142','181910142','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('217','XITPB','TP','181910143','181910143','AJI JAYA SAPUTRA','XI','R1','1','181910143','181910143','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('218','XITPB','TP','181910144','181910144','ANGGI MAULANA','XI','R1','1','181910144','181910144','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('219','XITPB','TP','181910146','181910146','AZHAR AL MUKHORI','XI','R1','1','181910146','181910146','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('220','XITPB','TP','181910147','181910147','AZZAR ASWAD','XI','R1','1','181910147','181910147','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('221','XITPB','TP','181910148','181910148','BAGAS INGJAGAT','XI','R1','1','181910148','181910148','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('222','XITPB','TP','181910149','181910149','BAYU FITRIYADI','XI','R1','1','181910149','181910149','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('223','XITPB','TP','181910150','181910150','DIMAS AL-KAHFI','XI','R1','1','181910150','181910150','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('224','XITPB','TP','181910151','181910151','DION DUMADI','XI','R1','1','181910151','181910151','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('225','XITPB','TP','181910152','181910152','HASANUDIN','XI','R1','1','181910152','181910152','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('226','XITPB','TP','181910153','181910153','INDRA JULIYANTO E','XI','R1','1','181910153','181910153','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('227','XITPB','TP','181910154','181910154','IRDAN ARDIANSYAH','XI','R1','1','181910154','181910154','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('228','XITPB','TP','181910155','181910155','JAKARIA','XI','R1','1','181910155','181910155','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('229','XITPB','TP','181910156','181910156','MUHAMAD ADHA LUBIS','XI','R1','1','181910156','181910156','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('230','XITPB','TP','181910157','181910157','MUHAMAD NASIR','XI','R1','1','181910157','181910157','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('231','XITPB','TP','181910158','181910158','M. AJI ANAFI','XI','R1','1','181910158','181910158','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('232','XITPB','TP','181910159','181910159','MUHAMAD FAJRI','XI','R1','1','181910159','181910159','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('233','XITPB','TP','181910160','181910160','MUHAMAD ZAELANI','XI','R1','1','181910160','181910160','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('234','XITPB','TP','181910162','181910162','JUNAEDI ALFADILAH','XI','R1','1','181910162','181910162','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('235','XITPB','TP','181910164','181910164','RAIHAN MAULANA','XI','R1','1','181910164','181910164','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('236','XITPB','TP','181910165','181910165','RAJU','XI','R1','1','181910165','181910165','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('237','XITPB','TP','181910166','181910166','RENDI','XI','R1','1','181910166','181910166','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('238','XITPB','TP','181910167','181910167','RIZALDI ANDI YUSUF','XI','R1','1','181910167','181910167','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('239','XITPB','TP','181910168','181910168','RIZKI AZIS ARISENO','XI','R1','1','181910168','181910168','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('240','XITPB','TP','181910169','181910169','RIZKY SAPUTRA','XI','R1','1','181910169','181910169','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('241','XITPB','TP','181910170','181910170','SAHRUL BAHTIAR','XI','R1','1','181910170','181910170','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('242','XITPB','TP','181910171','181910171','YUSUP SURYA MAHENDRA','XI','R1','1','181910171','181910171','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('243','XITKRA','TKR','181910172','181910172','ABDUL AZIZ','XI','R1','1','181910172','181910172','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('244','XITKRA','TKR','181910173','181910173','ADE SUTRISNA','XI','R1','1','181910173','181910173','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('245','XITKRA','TKR','181910174','181910174','ADI SAPUTRA','XI','R1','1','181910174','181910174','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('246','XITKRA','TKR','181910175','181910175','AHMAD PAUZY','XI','R1','1','181910175','181910175','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('247','XITKRA','TKR','181910176','181910176','AHMAD SARPUJI','XI','R1','1','181910176','181910176','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('248','XITKRA','TKR','181910177','181910177','AJI PANGESTU','XI','R1','1','181910177','181910177','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('249','XITKRA','TKR','181910178','181910178','DEDE DARMANTO','XI','R1','1','181910178','181910178','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('250','XITKRA','TKR','181910179','181910179','DEDE LATIF','XI','R1','1','181910179','181910179','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('251','XITKRA','TKR','181910180','181910180','DENI SETIAWAN','XI','R1','1','181910180','181910180','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('252','XITKRA','TKR','181910181','181910181','DWI SAPUTRA','XI','R1','1','181910181','181910181','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('253','XITKRA','TKR','181910182','181910182','FAJAR FIRMANSYAH','XI','R1','1','181910182','181910182','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('254','XITKRA','TKR','181910184','181910184','HERI SAPUTRA','XI','R1','1','181910184','181910184','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('255','XITKRA','TKR','181910185','181910185','JUMA DERMAWAN','XI','R1','1','181910185','181910185','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('256','XITKRA','TKR','181910186','181910186','KARYADI','XI','R1','1','181910186','181910186','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('257','XITKRA','TKR','181910187','181910187','M ALI RAPI','XI','R1','1','181910187','181910187','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('258','XITKRA','TKR','181910188','181910188','M ARIF FADILAH','XI','R1','1','181910188','181910188','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('259','XITKRA','TKR','181910189','181910189','M RIAN ALFANDI','XI','R1','1','181910189','181910189','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('260','XITKRA','TKR','181910190','181910190','M. HAMDAN','XI','R1','1','181910190','181910190','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('261','XITKRA','TKR','181910191','181910191','MUHAMAD SUHANDA','XI','R1','1','181910191','181910191','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('262','XITKRA','TKR','181910192','181910192','MUHAMMAD IQBAL K','XI','R1','1','181910192','181910192','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('263','XITKRA','TKR','181910193','181910193','NABAWI','XI','R1','1','181910193','181910193','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('264','XITKRA','TKR','181910194','181910194','NANDIH','XI','R1','1','181910194','181910194','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('265','XITKRA','TKR','181910195','181910195','NARMAN','XI','R1','1','181910195','181910195','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('266','XITKRA','TKR','181910196','181910196','NURWAHIDIN','XI','R1','1','181910196','181910196','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('267','XITKRA','TKR','181910197','181910197','ODING','XI','R1','1','181910197','181910197','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('268','XITKRA','TKR','181910198','181910198','RADI SAPUTRA','XI','R1','1','181910198','181910198','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('269','XITKRA','TKR','181910199','181910199','RAHMATUSUZUD','XI','R1','1','181910199','181910199','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('270','XITKRA','TKR','181910200','181910200','RUDI SUPRIYATNA','XI','R1','1','181910200','181910200','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('271','XITKRA','TKR','181910201','181910201','SAHRUL HARYANTO','XI','R1','1','181910201','181910201','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('272','XITKRA','TKR','181910203','181910203','SUGIANTO','XI','R1','1','181910203','181910203','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('273','XITKRA','TKR','181910204','181910204','SYAHDA ACHMAD BACHTIAR','XI','R1','1','181910204','181910204','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('274','XITKRA','TKR','181910205','181910205','TEGAR PERMANA ','XI','R1','1','181910205','181910205','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('275','XITKRA','TKR','181910206','181910206','USANDI SAPUTRA','XI','R1','1','181910206','181910206','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('276','XITKRA','TKR','181910207','181910207','WAHYUDI RIYANTO','XI','R1','1','181910207','181910207','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('277','XITKRB','TKR','181910208','181910208','ADE MAULANA','XI','R1','1','181910208','181910208','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('278','XITKRB','TKR','181910209','181910209','AFIF DEVAJI','XI','R1','1','181910209','181910209','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('279','XITKRB','TKR','181910210','181910210','AHMAD FAISAL','XI','R1','1','181910210','181910210','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('280','XITKRB','TKR','181910211','181910211','ALDI BAEHAQI','XI','R1','1','181910211','181910211','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('281','XITKRB','TKR','181910212','181910212','APRIANSYAH ABDILLAH','XI','R1','1','181910212','181910212','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('282','XITKRB','TKR','181910214','181910214','BAGUS KARAHMAT','XI','R1','1','181910214','181910214','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('283','XITKRB','TKR','181910215','181910215','DEDE KURNIAWAN','XI','R1','1','181910215','181910215','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('284','XITKRB','TKR','181910216','181910216','DENI','XI','R1','1','181910216','181910216','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('285','XITKRB','TKR','181910217','181910217','DIMAS AFRIANSYAH','XI','R1','1','181910217','181910217','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('286','XITKRB','TKR','181910218','181910218','FAHRU ROJI AKBAR','XI','R1','1','181910218','181910218','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('287','XITKRB','TKR','181910219','181910219','FAJAR SUSENO','XI','R1','1','181910219','181910219','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('288','XITKRB','TKR','181910220','181910220','KESSA MAHARDHIKA PRIANTO','XI','R1','1','181910220','181910220','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('289','XITKRB','TKR','181910221','181910221','M. HILMI FATHU RAHMAN','XI','R1','1','181910221','181910221','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('290','XITKRB','TKR','181910222','181910222','M. IQBAL','XI','R1','1','181910222','181910222','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('291','XITKRB','TKR','181910223','181910223','MUHAMMAD ERLANGGA','XI','R1','1','181910223','181910223','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('292','XITKRB','TKR','181910224','181910224','MUHAMAD HAMZAH NUR A','XI','R1','1','181910224','181910224','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('293','XITKRB','TKR','181910225','181910225','MUHAMAD SAMSUL FAJRI','XI','R1','1','181910225','181910225','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('294','XITKRB','TKR','181910226','181910226','RAFI RAMADHAN AKHWAL','XI','R1','1','181910226','181910226','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('295','XITKRB','TKR','181910228','181910228','RIZKI DWI ANDIKA','XI','R1','1','181910228','181910228','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('296','XITKRB','TKR','181910229','181910229','SAIPUL ANWAR','XI','R1','1','181910229','181910229','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('297','XITKRB','TKR','181910231','181910231','TOTONG INDA','XI','R1','1','181910231','181910231','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('298','XITKRB','TKR','181910232','181910232','YOGA PAMUNGKAS','XI','R1','1','181910232','181910232','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('299','XITKJC','TKJ','181910233','181910233','KIZS MAHLENA','XI','R1','1','181910233','181910233','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('300','XITKRB','TKR','181910235','181910235','YONGKI PRASTIYO RAHARJO','XI','R1','1','181910235','181910235','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('301','XITKJC','TKJ','181910236','181910236','SINTA ALIYANA DEWI','XI','R1','1','181910236','181910236','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('302','XTKJA','TKJ','192010001','192010001','AAN APRILIA','X','R1','1','192010001','192010001','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('303','XTKJA','TKJ','192010002','192010002','ADINDA PUTRI','X','R1','1','192010002','192010002','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('304','XTKJA','TKJ','192010003','192010003','ADRIANO','X','R1','1','192010003','192010003','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('305','XTKJA','TKJ','192010004','192010004','ALYSHA NURHIDAYAH S.','X','R1','1','192010004','192010004','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('306','XTKJA','TKJ','192010005','192010005','ANI AGUSTINA','X','R1','1','192010005','192010005','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('307','XTKJA','TKJ','192010006','192010006','BAGAS ARIESMA T','X','R1','1','192010006','192010006','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('308','XTKJA','TKJ','192010007','192010007','CHANTIKA ADYA NUR QOLBI','X','R1','1','192010007','192010007','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('309','XTKJA','TKJ','192010008','192010008','DELA SANJAYA','X','R1','1','192010008','192010008','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('310','XTKJA','TKJ','192010009','192010009','DESI','X','R1','1','192010009','192010009','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('311','XTKJA','TKJ','192010010','192010010','DEWI WULANSARI','X','R1','1','192010010','192010010','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('312','XTKJA','TKJ','192010011','192010011','DWI ITSNA AULIA','X','R1','1','192010011','192010011','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('313','XTKJA','TKJ','192010012','192010012','ERLINA','X','R1','1','192010012','192010012','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('314','XTKJA','TKJ','192010013','192010013','FITRIA SRI RAHAYU','X','R1','1','192010013','192010013','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('315','XTKJA','TKJ','192010014','192010014','INGGIT SARASWATI NUR AIN','X','R1','1','192010014','192010014','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('316','XTKJA','TKJ','192010015','192010015','LAITA KAUMIA','X','R1','1','192010015','192010015','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('317','XTKJA','TKJ','192010016','192010016','MAULIDIA FITRIA','X','R1','1','192010016','192010016','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('318','XTKJA','TKJ','192010017','192010017','MULYANAH','X','R1','1','192010017','192010017','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('319','XTKJA','TKJ','192010018','192010018','NASYA AGISYA SEHAH NASUTION','X','R1','1','192010018','192010018','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('320','XTKJA','TKJ','192010019','192010019','NOPI NURALIA','X','R1','1','192010019','192010019','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('321','XTKJA','TKJ','192010020','192010020','NURUL AWULIA','X','R1','1','192010020','192010020','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('322','XTKJA','TKJ','192010021','192010021','PUPUT MELATI','X','R1','1','192010021','192010021','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('323','XTKJA','TKJ','192010022','192010022','PUTRI NINGSIH','X','R1','1','192010022','192010022','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('324','XTKJA','TKJ','192010023','192010023','PUTRI SINTIA MAWADAH','X','R1','1','192010023','192010023','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('325','XTKJA','TKJ','192010024','192010024','RAMI FITRIYANI','X','R1','1','192010024','192010024','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('326','XTKJA','TKJ','192010025','192010025','RIDHO RAMADHANI','X','R1','1','192010025','192010025','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('327','XTKJA','TKJ','192010026','192010026','RISKA HANDAYANI','X','R1','1','192010026','192010026','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('328','XTKJA','TKJ','192010027','192010027','SELVI AULIA SARI','X','R1','1','192010027','192010027','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('329','XTKJA','TKJ','192010028','192010028','SINDI HERMANSYAH','X','R1','1','192010028','192010028','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('330','XTKJA','TKJ','192010029','192010029','SITI NUR FADILAH','X','R1','1','192010029','192010029','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('331','XTKJA','TKJ','192010030','192010030','SITI NURUL ALFIA','X','R1','1','192010030','192010030','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('332','XTKJA','TKJ','192010031','192010031','SRI RIZKI AMELIA','X','R1','1','192010031','192010031','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('333','XTKJA','TKJ','192010032','192010032','SUSILAWATI DEWI','X','R1','1','192010032','192010032','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('334','XTKJA','TKJ','192010033','192010033','TINAH','X','R1','1','192010033','192010033','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('335','XTKJA','TKJ','192010034','192010034','WIDIA NURAENI','X','R1','1','192010034','192010034','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('336','XTKJA','TKJ','192010035','192010035','WULANDARI','X','R1','1','192010035','192010035','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('337','XTKJA','TKJ','192010036','192010036','YESA KARTIKA AMALIA','X','R1','1','192010036','192010036','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('338','XTKJB','TKJ','192010037','192010037','ABDUL MAZID','X','R1','1','192010037','192010037','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('339','XTKJB','TKJ','192010038','192010038','ALFINA DAMAYANTI','X','R1','1','192010038','192010038','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('340','XTKJB','TKJ','192010039','192010039','ANDINI SUPANDI','X','R1','1','192010039','192010039','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('341','XTKJB','TKJ','192010040','192010040','ASIH SUSILAWATI','X','R1','1','192010040','192010040','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('342','XTKJB','TKJ','192010041','192010041','BINTANG AGUSTINA','X','R1','1','192010041','192010041','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('343','XTKJB','TKJ','192010042','192010042','CICIH OKHTAPIA','X','R1','1','192010042','192010042','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('344','XTKJB','TKJ','192010043','192010043','DELIA PUSPITA WATI','X','R1','1','192010043','192010043','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('345','XTKJB','TKJ','192010044','192010044','DESTI SALSAVIRA','X','R1','1','192010044','192010044','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('346','XTKJB','TKJ','192010045','192010045','DIMAS NURKHARISMAN TRIYANTO','X','R1','1','192010045','192010045','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('347','XTKJB','TKJ','192010046','192010046','ELISAH','X','R1','1','192010046','192010046','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('348','XTKJB','TKJ','192010047','192010047','EUIS FARADILLA','X','R1','1','192010047','192010047','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('349','XTKJB','TKJ','192010048','192010048','INDAH SARI','X','R1','1','192010048','192010048','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('350','XTKJB','TKJ','192010049','192010049','INTAN AVRILIA MELANI','X','R1','1','192010049','192010049','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('351','XTKJB','TKJ','192010050','192010050','JANES CINTYA','X','R1','1','192010050','192010050','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('352','XTKJB','TKJ','192010051','192010051','JULIA AGUSTIN','X','R1','1','192010051','192010051','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('353','XTKJB','TKJ','192010052','192010052','LILIS','X','R1','1','192010052','192010052','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('354','XTKJB','TKJ','192010053','192010053','M.FAISAL ZUMHARI','X','R1','1','192010053','192010053','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('355','XTKJB','TKJ','192010054','192010054','MEGA LESTARI','X','R1','1','192010054','192010054','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('356','XTKJB','TKJ','192010055','192010055','MUTIARA HATI','X','R1','1','192010055','192010055','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('357','XTKJB','TKJ','192010056','192010056','NATASYA SEPTIANI','X','R1','1','192010056','192010056','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('358','XTKJB','TKJ','192010057','192010057','NOVIA KRISTIN','X','R1','1','192010057','192010057','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('359','XTKJB','TKJ','192010058','192010058','NYAI KESIH ','X','R1','1','192010058','192010058','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('360','XTKJB','TKJ','192010059','192010059','PUTRA PRATAMA','X','R1','1','192010059','192010059','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('361','XTKJB','TKJ','192010060','192010060','PUTRI SURYATI','X','R1','1','192010060','192010060','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('362','XTKJB','TKJ','192010061','192010061','RANAH SRI RAHAYU','X','R1','1','192010061','192010061','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('363','XTKJB','TKJ','192010062','192010062','RIKA RIYANI','X','R1','1','192010062','192010062','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('364','XTKJB','TKJ','192010063','192010063','ROHAYATI','X','R1','1','192010063','192010063','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('365','XTKJB','TKJ','192010064','192010064','SEPTIANA BALQIS','X','R1','1','192010064','192010064','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('366','XTKJB','TKJ','192010065','192010065','SITI FATMAWATI','X','R1','1','192010065','192010065','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('367','XTKJB','TKJ','192010066','192010066','SOMIHLIA','X','R1','1','192010066','192010066','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('368','XTKJB','TKJ','192010067','192010067','TARNIH','X','R1','1','192010067','192010067','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('369','XTKJB','TKJ','192010068','192010068','TIYA YUNITA','X','R1','1','192010068','192010068','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('370','XTKJB','TKJ','192010069','192010069','WIDIYAWATI','X','R1','1','192010069','192010069','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('371','XTKJB','TKJ','192010070','192010070','WULAN NURUL FADILAH','X','R1','1','192010070','192010070','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('372','XTKJB','TKJ','192010071','192010071','WULANDARI','X','R1','1','192010071','192010071','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('373','XTKJB','TKJ','192010072','192010072','YULIA CITRA KOMALA DEWI','X','R1','1','192010072','192010072','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('374','XTKJC','TKJ','192010073','192010073','ABELIA FITRI','X','R1','1','192010073','192010073','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('375','XTKJC','TKJ','192010074','192010074','ANDARA NUROLIVIA','X','R1','1','192010074','192010074','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('376','XTKJC','TKJ','192010075','192010075','ATALIA SALSABILA','X','R1','1','192010075','192010075','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('377','XTKJC','TKJ','192010076','192010076','BULAN SAFITRI','X','R1','1','192010076','192010076','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('378','XTKJC','TKJ','192010077','192010077','CAHAYA JIHAN','X','R1','1','192010077','192010077','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('379','XTKJC','TKJ','192010078','192010078','CINDY AULIA AZMI','X','R1','1','192010078','192010078','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('380','XTKJC','TKJ','192010079','192010079','DELIMA','X','R1','1','192010079','192010079','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('381','XTKJC','TKJ','192010080','192010080','DEVIA','X','R1','1','192010080','192010080','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('382','XTKJC','TKJ','192010081','192010081','DINI APRILIANI','X','R1','1','192010081','192010081','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('383','XTKJC','TKJ','192010082','192010082','ELLIS','X','R1','1','192010082','192010082','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('384','XTKJC','TKJ','192010083','192010083','EVITA FEBRIYANTI','X','R1','1','192010083','192010083','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('385','XTKJC','TKJ','192010084','192010084','INDAH SULASTRI','X','R1','1','192010084','192010084','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('386','XTKJC','TKJ','192010085','192010085','INTAN CHANTIKA SEPTIANI','X','R1','1','192010085','192010085','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('387','XTKJC','TKJ','192010086','192010086','KARLITA NANDA PRASETYA','X','R1','1','192010086','192010086','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('388','XTKJC','TKJ','192010087','192010087','LISA RAHMAWATI','X','R1','1','192010087','192010087','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('389','XTKJC','TKJ','192010088','192010088','MELANI','X','R1','1','192010088','192010088','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('390','XTKJC','TKJ','192010089','192010089','NADIA VEGA','X','R1','1','192010089','192010089','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('391','XTKJC','TKJ','192010090','192010090','NENENG ANJARWATI','X','R1','1','192010090','192010090','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('392','XTKJC','TKJ','192010091','192010091','NUR AISAH','X','R1','1','192010091','192010091','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('393','XTKJC','TKJ','192010092','192010092','PIOLA PUTRI ALFIANI','X','R1','1','192010092','192010092','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('394','XTKJC','TKJ','192010093','192010093','PUTRI','X','R1','1','192010093','192010093','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('395','XTKJC','TKJ','192010094','192010094','RAHMAD ARDIANSYAH','X','R1','1','192010094','192010094','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('396','XTKJC','TKJ','192010096','192010096','RIKA SARTIKA','X','R1','1','192010096','192010096','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('397','XTKJC','TKJ','192010097','192010097','SANTI SUSILAWATI','X','R1','1','192010097','192010097','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('398','XTKJC','TKJ','192010098','192010098','SHELA AGUSTIN','X','R1','1','192010098','192010098','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('399','XTKJC','TKJ','192010099','192010099','SITI HABIBAH','X','R1','1','192010099','192010099','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('400','XTKJC','TKJ','192010100','192010100','SITI NURAINI','X','R1','1','192010100','192010100','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('401','XTKJC','TKJ','192010101','192010101','SONIA','X','R1','1','192010101','192010101','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('402','XTKJC','TKJ','192010102','192010102','SUMI ASIH','X','R1','1','192010102','192010102','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('403','XTKJC','TKJ','192010103','192010103','TEGAR PRIBADI','X','R1','1','192010103','192010103','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('404','XTKJC','TKJ','192010104','192010104','VEVI PRATIWI','X','R1','1','192010104','192010104','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('405','XTKJC','TKJ','192010105','192010105','WULAN HANDAYANI','X','R1','1','192010105','192010105','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('406','XTKJC','TKJ','192010106','192010106','YANTI','X','R1','1','192010106','192010106','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('407','XTKJC','TKJ','192010107','192010107','YUNITA RAHMANIA','X','R1','1','192010107','192010107','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('408','XTKJD','TKJ','192010108','192010108','CINDY MEDIKA SARI','X','R1','1','192010108','192010108','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('409','XTKJD','TKJ','192010109','192010109','DELLA PUSPITA SARI','X','R1','1','192010109','192010109','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('410','XTKJD','TKJ','192010110','192010110','DEWI LESTARI','X','R1','1','192010110','192010110','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('411','XTKJD','TKJ','192010111','192010111','DIYAN PUSPITA DEWI','X','R1','1','192010111','192010111','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('412','XTKJD','TKJ','192010112','192010112','ENDAH PUSPITASARI','X','R1','1','192010112','192010112','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('413','XTKJD','TKJ','192010113','192010113','FINA KOMARIAH','X','R1','1','192010113','192010113','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('414','XTKJD','TKJ','192010114','192010114','INE LESTARI','X','R1','1','192010114','192010114','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('415','XTKJD','TKJ','192010115','192010115','INTAN NUR AINI','X','R1','1','192010115','192010115','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('416','XTKJD','TKJ','192010116','192010116','KIKI PRASETYO','X','R1','1','192010116','192010116','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('417','XTKJD','TKJ','192010117','192010117','MIRA','X','R1','1','192010117','192010117','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('418','XTKJD','TKJ','192010118','192010118','NARDILA OKTAVIANA','X','R1','1','192010118','192010118','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('419','XTKJD','TKJ','192010119','192010119','NOLA BELIA PUTRI','X','R1','1','192010119','192010119','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('420','XTKJD','TKJ','192010120','192010120','NUR FAIZAH','X','R1','1','192010120','192010120','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('421','XTKJD','TKJ','192010121','192010121','PITRIYANI NURHAYATI','X','R1','1','192010121','192010121','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('422','XTKJD','TKJ','192010122','192010122','PUTRI MAYANG SARI','X','R1','1','192010122','192010122','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('423','XTKJD','TKJ','192010123','192010123','PUTRI RAHAYU NF','X','R1','1','192010123','192010123','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('424','XTKJD','TKJ','192010124','192010124','PUTRI SANTIA NURJANAH','X','R1','1','192010124','192010124','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('425','XTKJD','TKJ','192010125','192010125','RAHMADINI','X','R1','1','192010125','192010125','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('426','XTKJD','TKJ','192010126','192010126','RATIH ALAWIYAH','X','R1','1','192010126','192010126','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('427','XTKJD','TKJ','192010127','192010127','RIRIH RAHMAWATI','X','R1','1','192010127','192010127','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('428','XTKJD','TKJ','192010128','192010128','SELOMITA DIANA','X','R1','1','192010128','192010128','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('429','XTKJD','TKJ','192010130','192010130','SITI MARYATI','X','R1','1','192010130','192010130','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('430','XTKJD','TKJ','192010131','192010131','SITI NUR HAZIZAH','X','R1','1','192010131','192010131','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('431','XTKJD','TKJ','192010132','192010132','SITI NURDELA','X','R1','1','192010132','192010132','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('432','XTKJD','TKJ','192010133','192010133','SRI ASTUTI','X','R1','1','192010133','192010133','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('433','XTKJD','TKJ','192010134','192010134','SUCI INDAH KHORI','X','R1','1','192010134','192010134','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('434','XTKJD','TKJ','192010135','192010135','SURYANIH','X','R1','1','192010135','192010135','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('435','XTKJD','TKJ','192010136','192010136','TIARA AMELIA','X','R1','1','192010136','192010136','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('436','XTKJD','TKJ','192010137','192010137','VITO SIDIK AL-GHANIYY','X','R1','1','192010137','192010137','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('437','XTKJD','TKJ','192010138','192010138','YASINTA HARUM SARI','X','R1','1','192010138','192010138','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('438','XTPA','TP','192010139','192010139','ABDUL AZIS','X','R1','1','192010139','192010139','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('439','XTPA','TP','192010140','192010140','AHMAD RIFAI','X','R1','1','192010140','192010140','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('440','XTPA','TP','192010141','192010141','AKBAR MAULANA','X','R1','1','192010141','192010141','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('441','XTPA','TP','192010142','192010142','ALDI GILANG SAPUTRA','X','R1','1','192010142','192010142','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('442','XTPA','TP','192010143','192010143','ALPIN NURHAKIM','X','R1','1','192010143','192010143','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('443','XTPA','TP','192010145','192010145','ANTUM DAROZATUN','X','R1','1','192010145','192010145','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('444','XTPA','TP','192010146','192010146','DHIMAS SANDITYAR RIFANI','X','R1','1','192010146','192010146','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('445','XTPA','TP','192010147','192010147','DICKI PRIADI','X','R1','1','192010147','192010147','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('446','XTPA','TP','192010148','192010148','ERLANGGA PRAMUDYA ALKAUTSAR','X','R1','1','192010148','192010148','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('447','XTPA','TP','192010149','192010149','FAHRI RAMADANI','X','R1','1','192010149','192010149','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('448','XTPA','TP','192010150','192010150','HASSAN BACHRI WIRAYUDHA','X','R1','1','192010150','192010150','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('449','XTPA','TP','192010151','192010151','ILHAM','X','R1','1','192010151','192010151','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('450','XTPA','TP','192010152','192010152','IVAN','X','R1','1','192010152','192010152','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('451','XTPA','TP','192010153','192010153','JAYA','X','R1','1','192010153','192010153','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('452','XTPA','TP','192010154','192010154','LANDI DARMADI','X','R1','1','192010154','192010154','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('453','XTPA','TP','192010155','192010155','MUHAMAD FAHRI FAUZI','X','R1','1','192010155','192010155','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('454','XTPA','TP','192010157','192010157','MUHAMMAD ABDUL RICO SYAFEI','X','R1','1','192010157','192010157','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('455','XTPA','TP','192010158','192010158','MUHAMMAD RIYAN SAPUTRA','X','R1','1','192010158','192010158','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('456','XTPA','TP','192010159','192010159','MUHAMMAD YUDHA SAN FIRDAUS','X','R1','1','192010159','192010159','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('457','XTPA','TP','192010160','192010160','PRAYOGI SASTRA ADIRAJA','X','R1','1','192010160','192010160','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('458','XTPA','TP','192010161','192010161','RENDI ARDIANSYAH','X','R1','1','192010161','192010161','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('459','XTPA','TP','192010162','192010162','RENDI WIJAYA KUSUMA','X','R1','1','192010162','192010162','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('460','XTPA','TP','192010163','192010163','RIO AGUSTIAN','X','R1','1','192010163','192010163','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('461','XTPA','TP','192010164','192010164','RIZKI RAMADHAN','X','R1','1','192010164','192010164','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('462','XTPA','TP','192010165','192010165','ROHMATULLAH','X','R1','1','192010165','192010165','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('463','XTPA','TP','192010166','192010166','RYAN RESTIAWAN','X','R1','1','192010166','192010166','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('464','XTPA','TP','192010167','192010167','SEPTIAN','X','R1','1','192010167','192010167','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('465','XTPA','TP','192010168','192010168','SUHENDRA','X','R1','1','192010168','192010168','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('466','XTPA','TP','192010169','192010169','WAHYU WINATA','X','R1','1','192010169','192010169','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('467','XTPA','TP','192010170','192010170','WARJAYA','X','R1','1','192010170','192010170','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('468','XTPB','TP','192010171','192010171','ABDUL YOGI','X','R1','1','192010171','192010171','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('469','XTPB','TP','192010172','192010172','AHMAD RIFA\'I','X','R1','1','192010172','192010172','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('470','XTPB','TP','192010173','192010173','AKMALLUDIN ALFARIZI','X','R1','1','192010173','192010173','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('471','XTPB','TP','192010174','192010174','ALFIN SYAHYANA','X','R1','1','192010174','192010174','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('472','XTPB','TP','192010175','192010175','ALVIN CANDRA DITA','X','R1','1','192010175','192010175','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('473','XTPB','TP','192010176','192010176','ANGGA','X','R1','1','192010176','192010176','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('474','XTPB','TP','192010177','192010177','ARDIYANSYAH','X','R1','1','192010177','192010177','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('475','XTPB','TP','192010178','192010178','DIMAS ANDREAN','X','R1','1','192010178','192010178','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('476','XTPB','TP','192010179','192010179','PADLI','X','R1','1','192010179','192010179','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('477','XTPB','TP','192010180','192010180','FARID ARDIANSYAH','X','R1','1','192010180','192010180','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('478','XTPB','TP','192010181','192010181','HERDI HIDAYAT','X','R1','1','192010181','192010181','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('479','XTPB','TP','192010182','192010182','IRFAN MAULANA','X','R1','1','192010182','192010182','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('480','XTPB','TP','192010183','192010183','IVAN SETIAWAN','X','R1','1','192010183','192010183','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('481','XTPB','TP','192010184','192010184','KANDI HERMAWAN','X','R1','1','192010184','192010184','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('482','XTPB','TP','192010185','192010185','MIFTAH KHOIRUDIN NUR','X','R1','1','192010185','192010185','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('483','XTPB','TP','192010186','192010186','MUHAMMAD FARHAN AL KOYA','X','R1','1','192010186','192010186','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('484','XTPB','TP','192010188','192010188','MUHAMMAD ARENDI','X','R1','1','192010188','192010188','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('485','XTPB','TP','192010189','192010189','MUHAMMAD RIZKI AGUSTIAN','X','R1','1','192010189','192010189','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('486','XTPB','TP','192010190','192010190','MUHARAMA','X','R1','1','192010190','192010190','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('487','XTPB','TP','192010191','192010191','NUR FAJAR','X','R1','1','192010191','192010191','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('488','XTPB','TP','192010192','192010192','RAHMAT HIDAYAT','X','R1','1','192010192','192010192','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('489','XTPB','TP','192010193','192010193','RENDI TRIYANTO','X','R1','1','192010193','192010193','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('490','XTPB','TP','192010194','192010194','RIAN WIRANTO','X','R1','1','192010194','192010194','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('491','XTPB','TP','192010195','192010195','RIO KUSNADI','X','R1','1','192010195','192010195','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('492','XTPB','TP','192010196','192010196','RIZKI WAHYUDI ','X','R1','1','192010196','192010196','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('493','XTPB','TP','192010197','192010197','ROY HANAVI','X','R1','1','192010197','192010197','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('494','XTPB','TP','192010198','192010198','SANDI IRAWAN','X','R1','1','192010198','192010198','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('495','XTPB','TP','192010199','192010199','SUBANDI','X','R1','1','192010199','192010199','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('496','XTPB','TP','192010200','192010200','TASMAN BAGAS','X','R1','1','192010200','192010200','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('497','XTPB','TP','192010201','192010201','YARIS RIYALDI','X','R1','1','192010201','192010201','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('498','XTPC','TP','192010202','192010202','ADO SAPUTRA','X','R1','1','192010202','192010202','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('499','XTPC','TP','192010203','192010203','AHMAD ZARKASIH','X','R1','1','192010203','192010203','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('500','XTPC','TP','192010204','192010204','ALDI','X','R1','1','192010204','192010204','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('501','XTPC','TP','192010205','192010205','ALPIAN','X','R1','1','192010205','192010205','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('502','XTPC','TP','192010206','192010206','ANDI JUANDI','X','R1','1','192010206','192010206','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('503','XTPC','TP','192010207','192010207','ANJAS SAPUTRA','X','R1','1','192010207','192010207','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('504','XTPC','TP','192010208','192010208','BAYU SAMUDRA','X','R1','1','192010208','192010208','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('505','XTPC','TP','192010209','192010209','EKY MAULANA PRAYOGA','X','R1','1','192010209','192010209','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('506','XTPC','TP','192010210','192010210','FAHRI ALPHARIZI','X','R1','1','192010210','192010210','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('507','XTPC','TP','192010211','192010211','FERDIANSYAH','X','R1','1','192010211','192010211','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('508','XTPC','TP','192010212','192010212','IKBAL','X','R1','1','192010212','192010212','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('509','XTPC','TP','192010213','192010213','ISHAK TABAH MAULANA','X','R1','1','192010213','192010213','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('510','XTPC','TP','192010214','192010214','JAMAR MAULANA','X','R1','1','192010214','192010214','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('511','XTPC','TP','192010215','192010215','KHOIRUL FADILLAH','X','R1','1','192010215','192010215','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('512','XTPC','TP','192010216','192010216','MIFTAHUL KHOIRI RIFKI','X','R1','1','192010216','192010216','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('513','XTPC','TP','192010217','192010217','MUHAMAD IKBAL MAULANA','X','R1','1','192010217','192010217','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('514','XTPC','TP','192010218','192010218','MUHAMAD WANDI ALFIRDAUS','X','R1','1','192010218','192010218','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('515','XTPC','TP','192010219','192010219','MUHAMMAD RISKI PAUJI','X','R1','1','192010219','192010219','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('516','XTPC','TP','192010220','192010220','MUHAMAD SURYA AJI','X','R1','1','192010220','192010220','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('517','XTPC','TP','192010222','192010222','RENDI WIJAYA','X','R1','1','192010222','192010222','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('518','XTPC','TP','192010223','192010223','RIDWAN','X','R1','1','192010223','192010223','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('519','XTPC','TP','192010224','192010224','RIZKI MAHESAH','X','R1','1','192010224','192010224','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('520','XTPC','TP','192010225','192010225','RIZKY ABIYANTO','X','R1','1','192010225','192010225','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('521','XTPC','TP','192010226','192010226','RULI AGUSTINA','X','R1','1','192010226','192010226','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('522','XTPC','TP','192010227','192010227','SATRIA RAMA HERMAWAN','X','R1','1','192010227','192010227','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('523','XTPC','TP','192010228','192010228','SUBANDI','X','R1','1','192010228','192010228','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('524','XTPC','TP','192010229','192010229','UBAY ARDIANSYAH','X','R1','1','192010229','192010229','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('525','XTPC','TP','192010230','192010230','WARFAN HIDAYAT','X','R1','1','192010230','192010230','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('526','XTKRA','TKR','192010231','192010231','ABDUL AZIS','X','R1','1','192010231','192010231','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('527','XTKRA','TKR','192010232','192010232','ABDUL KOMAR','X','R1','1','192010232','192010232','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('528','XTKRA','TKR','192010233','192010233','AHMAD AL BAWI','X','R1','1','192010233','192010233','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('529','XTKRA','TKR','192010234','192010234','ALDI','X','R1','1','192010234','192010234','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('530','XTKRA','TKR','192010235','192010235','ALPIN','X','R1','1','192010235','192010235','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('531','XTKRA','TKR','192010236','192010236','ANDRIAN MUH. F','X','R1','1','192010236','192010236','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('532','XTKRA','TKR','192010237','192010237','ANGGI','X','R1','1','192010237','192010237','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('533','XTKRA','TKR','192010238','192010238','ASRI ROSUL MUTTAQIN','X','R1','1','192010238','192010238','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('534','XTKRA','TKR','192010239','192010239','DICKY UMBARA','X','R1','1','192010239','192010239','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('535','XTKRA','TKR','192010240','192010240','DIMAS SAPUTRA','X','R1','1','192010240','192010240','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('536','XTKRA','TKR','192010241','192010241','ENRIKO','X','R1','1','192010241','192010241','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('537','XTKRA','TKR','192010242','192010242','FAHRUL ROZI','X','R1','1','192010242','192010242','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('538','XTKRA','TKR','192010243','192010243','HABIL MAULANA RAKASIWI','X','R1','1','192010243','192010243','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('539','XTKRA','TKR','192010244','192010244','HERTONO','X','R1','1','192010244','192010244','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('540','XTKRA','TKR','192010245','192010245','IMAR','X','R1','1','192010245','192010245','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('541','XTKRA','TKR','192010246','192010246','JEPRI DAURI DAUD','X','R1','1','192010246','192010246','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('542','XTKRA','TKR','192010247','192010247','KUSNADI','X','R1','1','192010247','192010247','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('543','XTKRA','TKR','192010248','192010248','MUHAMAD SAJILI','X','R1','1','192010248','192010248','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('544','XTKRA','TKR','192010249','192010249','MUHAMMAD DANU RAHMAN','X','R1','1','192010249','192010249','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('545','XTKRA','TKR','192010250','192010250','MUH. RAFFA AL-FARIZQI','X','R1','1','192010250','192010250','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('546','XTKRA','TKR','192010251','192010251','MUHAMMAD RIZKI ABDULLAH','X','R1','1','192010251','192010251','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('547','XTKRA','TKR','192010252','192010252','MUSLIN','X','R1','1','192010252','192010252','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('548','XTKRA','TKR','192010253','192010253','NATROM','X','R1','1','192010253','192010253','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('549','XTKRA','TKR','192010254','192010254','RAFLY RAMADHAN','X','R1','1','192010254','192010254','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('550','XTKRA','TKR','192010255','192010255','RIDWAN MAULANA FIRDAUS','X','R1','1','192010255','192010255','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('551','XTKRA','TKR','192010256','192010256','RIO SETIAWAN','X','R1','1','192010256','192010256','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('552','XTKRA','TKR','192010257','192010257','RUDI','X','R1','1','192010257','192010257','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('553','XTKRA','TKR','192010258','192010258','SAJA','X','R1','1','192010258','192010258','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('554','XTKRA','TKR','192010259','192010259','SUGIH SUTISNA','X','R1','1','192010259','192010259','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('555','XTKRA','TKR','192010260','192010260','SYAHRUL DWI HARZA','X','R1','1','192010260','192010260','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('556','XTKRA','TKR','192010261','192010261','WANDI FEBIYANTO','X','R1','1','192010261','192010261','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('557','XTKRA','TKR','192010262','192010262','YOGI PRADANA PUTRA','X','R1','1','192010262','192010262','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('558','XTKRA','TKR','192010263','192010263','YUSUP YULIAN','X','R1','1','192010263','192010263','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('559','XTKRB','TKR','192010264','192010264','ABDUL PAQIH','X','R1','1','192010264','192010264','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('560','XTKRB','TKR','192010265','192010265','ABDUL ROHIM','X','R1','1','192010265','192010265','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('561','XTKRB','TKR','192010266','192010266','AHMAD FADLI','X','R1','1','192010266','192010266','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('562','XTKRB','TKR','192010267','192010267','ALFAN ABDUL HADI','X','R1','1','192010267','192010267','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('563','XTKRB','TKR','192010268','192010268','ANANG SAPUTRA','X','R1','1','192010268','192010268','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('564','XTKRB','TKR','192010269','192010269','ARIQ ARKANA SUTANDI','X','R1','1','192010269','192010269','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('565','XTKRB','TKR','192010270','192010270','DANI HERLANGGA','X','R1','1','192010270','192010270','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('566','XTKRB','TKR','192010271','192010271','DIDI SANJAYA','X','R1','1','192010271','192010271','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('567','XTKRB','TKR','192010272','192010272','DIMAS ANDREAN','X','R1','1','192010272','192010272','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('568','XTKRB','TKR','192010273','192010273','EGI','X','R1','1','192010273','192010273','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('569','XTKRB','TKR','192010274','192010274','FADLI APRIYAYI SENJA','X','R1','1','192010274','192010274','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('570','XTKRB','TKR','192010275','192010275','FAJAR GUSSANDI','X','R1','1','192010275','192010275','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('571','XTKRB','TKR','192010276','192010276','HARDIANSYAH','X','R1','1','192010276','192010276','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('572','XTKRB','TKR','192010277','192010277','HIJABULLAH BISMA TAWASSULA','X','R1','1','192010277','192010277','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('573','XTKRB','TKR','192010278','192010278','INDRA DWI ARYANTO','X','R1','1','192010278','192010278','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('574','XTKRB','TKR','192010279','192010279','KARNADI','X','R1','1','192010279','192010279','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('575','XTKRB','TKR','192010280','192010280','M. IKBAL','X','R1','1','192010280','192010280','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('576','XTKRB','TKR','192010281','192010281','MUHAMAD IVAN KURNIAWAN','X','R1','1','192010281','192010281','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('577','XTKRB','TKR','192010282','192010282','MUHAMAD WASIM','X','R1','1','192010282','192010282','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('578','XTKRB','TKR','192010283','192010283','MUHAMMAD FAUZI NURHAKIKI','X','R1','1','192010283','192010283','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('579','XTKRB','TKR','192010284','192010284','MUHAMMAD RAFLI ARRASID','X','R1','1','192010284','192010284','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('580','XTKRB','TKR','192010285','192010285','MUHAMMAD RIZKI MULYANA','X','R1','1','192010285','192010285','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('581','XTKRB','TKR','192010286','192010286','NALIH ARI SETIADI','X','R1','1','192010286','192010286','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('582','XTKRB','TKR','192010287','192010287','PEBRIANSYAH','X','R1','1','192010287','192010287','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('583','XTKRB','TKR','192010288','192010288','RAFLI SETIAWAN ZULKARNAIN','X','R1','1','192010288','192010288','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('584','XTKRB','TKR','192010289','192010289','RIJAL UMAMI','X','R1','1','192010289','192010289','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('585','XTKRB','TKR','192010290','192010290','RIO FEBRIAN','X','R1','1','192010290','192010290','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('586','XTKRB','TKR','192010291','192010291','RIZKI ADITIA SAPUTRA','X','R1','1','192010291','192010291','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('587','XTKRB','TKR','192010292','192010292','SARIPUDIN ABDULAH','X','R1','1','192010292','192010292','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('588','XTKRB','TKR','192010293','192010293','SUHADIMAN RIYADI','X','R1','1','192010293','192010293','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('589','XTKRB','TKR','192010294','192010294','TARMIZI TAHIR','X','R1','1','192010294','192010294','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('590','XTKRB','TKR','192010295','192010295','YOGA PRASETIO','X','R1','1','192010295','192010295','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('591','XTKRC','TKR','192010297','192010297','ABDUL GOFAR','X','R1','1','192010297','192010297','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('592','XTKRC','TKR','192010298','192010298','ADITIYA WAHYUDI','X','R1','1','192010298','192010298','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('593','XTKRC','TKR','192010299','192010299','AHMAD RISKI FEBRIANSYAH','X','R1','1','192010299','192010299','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('594','XTKRC','TKR','192010300','192010300','ALI','X','R1','1','192010300','192010300','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('595','XTKRC','TKR','192010301','192010301','ARYA ADI PANGGA','X','R1','1','192010301','192010301','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('596','XTKRC','TKR','192010302','192010302','DENI MAULANA','X','R1','1','192010302','192010302','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('597','XTKRC','TKR','192010303','192010303','DIKI PRASTIO','X','R1','1','192010303','192010303','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('598','XTKRC','TKR','192010304','192010304','ENDIS SUDRAJAT','X','R1','1','192010304','192010304','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('599','XTKRC','TKR','192010305','192010305','FAHMI ALPHARIZI','X','R1','1','192010305','192010305','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('600','XTKRC','TKR','192010306','192010306','GEORGE GIOVANI','X','R1','1','192010306','192010306','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('601','XTKRC','TKR','192010307','192010307','HELMI ADE SAPUTRA','X','R1','1','192010307','192010307','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('602','XTKRC','TKR','192010308','192010308','IKSAN ROJIKIN','X','R1','1','192010308','192010308','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('603','XTKRC','TKR','192010309','192010309','INDRA SAPUTRA','X','R1','1','192010309','192010309','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('604','XTKRC','TKR','192010310','192010310','KOMARUDIN','X','R1','1','192010310','192010310','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('605','XTKRC','TKR','192010311','192010311','M. LAJI','X','R1','1','192010311','192010311','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('606','XTKRC','TKR','192010313','192010313','MUHAMAD NURDIN','X','R1','1','192010313','192010313','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('607','XTKRC','TKR','192010314','192010314','MUHAMAD YUSUF','X','R1','1','192010314','192010314','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('608','XTKRC','TKR','192010315','192010315','MUHAMMAD PURWO HADI SANTOSO','X','R1','1','192010315','192010315','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('609','XTKRC','TKR','192010316','192010316','MUHAMMAD RADI','X','R1','1','192010316','192010316','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('610','XTKRC','TKR','192010317','192010317','MUHAMMAD REZA ALPIAN','X','R1','1','192010317','192010317','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('611','XTKRC','TKR','192010318','192010318','MULYADI','X','R1','1','192010318','192010318','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('612','XTKRC','TKR','192010319','192010319','NASAN BASRI','X','R1','1','192010319','192010319','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('613','XTKRC','TKR','192010320','192010320','RADI','X','R1','1','192010320','192010320','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('614','XTKRC','TKR','192010321','192010321','RENDI ABDUL ZALI','X','R1','1','192010321','192010321','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('615','XTKRC','TKR','192010322','192010322','RIZKI SYAIFUL BAHRI','X','R1','1','192010322','192010322','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('616','XTKRC','TKR','192010324','192010324','SARIPUDIN SAPUTRA','X','R1','1','192010324','192010324','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('617','XTKRC','TKR','192010326','192010326','TARSIDI','X','R1','1','192010326','192010326','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('618','XTKRC','TKR','192010327','192010327','YOGA SAPUTRA','X','R1','1','192010327','192010327','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('619','XTKRC','TKR','192010328','192010328','YUSUP KHAERUL ANANDA','X','R1','1','192010328','192010328','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('620','XTKRC','TKR','192010329','192010329','ZAKI MUBARAK','X','R1','1','192010329','192010329','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('621','XTKRC','TKR','192010330','192010330','SAHRUL GUNAWAN','X','R1','1','192010330','192010330','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('622','XTPC','TP','192010331','192010331','CANDRA WIJAYA','X','R1','1','192010331','192010331','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('623','XTPC','TP','192010332','192010332','GERY FAUZI','X','R1','1','192010332','192010332','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('624','XTPA','TP','192010333','192010333','MAHPUD RYADI','X','R1','1','192010333','192010333','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('625','XTKJD','TKJ','192010334','192010334','SEPTIANI PRATIWI','X','R1','1','192010334','192010334','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('626','XTKJD','TKJ','192010335','192010335','DEWI KARTIKA','X','R1','1','192010335','192010335','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('627','XTPA','TP','192010336','192010336','HERU HERMAWAN','X','R1','1','192010336','192010336','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('628','XTKJC','TKJ','192010337','192010337','RERE AULIA RINJANI','X','R1','1','192010337','192010337','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('629','XTKRC','TKR','192010338','192010338','NUR FAUZI','X','R1','1','192010338','192010338','','SR01',NULL,NULL,NULL,'islam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('630','XTPC','TP','1234567','11111xxx','PAJAR SIDIK','XII','TKJ','1','P001','',NULL,'SR02',NULL,NULL,NULL,'ISLAM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('631','XTKJD','TP','123456','11111','PAJAR SIDIK','XI','R1','1','P001','A',NULL,'SR02',NULL,NULL,NULL,'ISLAM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('632','XIITKR','TP','123456','11111','PAJAR SIDIK','XI','TKJ','1','candy','bbb',NULL,'SR02',NULL,NULL,NULL,'ISLAM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');
INSERT INTO `siswa` VALUES ('633','XTKJD','TP','123456','xxx','PAJAR SIDIK','X','TKJ','1','222','BBB',NULL,'SR02',NULL,NULL,NULL,'ISLAM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0');

/*---------------------------------------------------------------
  TABLE: `soal`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `soal`;
CREATE TABLE `soal` (
  `id_soal` int(11) NOT NULL AUTO_INCREMENT,
  `id_mapel` int(11) NOT NULL,
  `nomor` int(5) DEFAULT NULL,
  `soal` longtext DEFAULT NULL,
  `jenis` int(1) DEFAULT NULL,
  `pilA` longtext DEFAULT NULL,
  `pilB` longtext DEFAULT NULL,
  `pilC` longtext DEFAULT NULL,
  `pilD` longtext DEFAULT NULL,
  `pilE` longtext DEFAULT NULL,
  `jawaban` varchar(1) DEFAULT NULL,
  `file` mediumtext DEFAULT NULL,
  `file1` mediumtext DEFAULT NULL,
  `fileA` mediumtext DEFAULT NULL,
  `fileB` mediumtext DEFAULT NULL,
  `fileC` mediumtext DEFAULT NULL,
  `fileD` mediumtext DEFAULT NULL,
  `fileE` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id_soal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*---------------------------------------------------------------
  TABLE: `token`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id_token` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(6) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `masa_berlaku` time NOT NULL,
  PRIMARY KEY (`id_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
INSERT INTO `token` VALUES   ('1','SZMDIV','2020-06-05 17:40:06','00:15:00');

/*---------------------------------------------------------------
  TABLE: `tugas`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `tugas`;
CREATE TABLE `tugas` (
  `id_tugas` int(255) NOT NULL AUTO_INCREMENT,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tugas` longtext NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*---------------------------------------------------------------
  TABLE: `ujian`
  ---------------------------------------------------------------*/
DROP TABLE IF EXISTS `ujian`;
CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL AUTO_INCREMENT,
  `kode_nama` varchar(255) DEFAULT '0',
  `id_pk` varchar(255) NOT NULL,
  `id_guru` int(5) NOT NULL,
  `id_mapel` int(5) NOT NULL,
  `kode_ujian` varchar(30) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL,
  `bobot_pg` int(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `bobot_esai` int(5) NOT NULL,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL,
  `lama_ujian` int(5) NOT NULL,
  `tgl_ujian` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `waktu_ujian` time DEFAULT NULL,
  `selesai_ujian` time DEFAULT NULL,
  `level` varchar(5) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `sesi` varchar(1) DEFAULT NULL,
  `acak` int(1) NOT NULL,
  `token` int(1) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `hasil` int(1) DEFAULT NULL,
  `kkm` varchar(128) DEFAULT NULL,
  `ulang` int(2) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  `reset` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_ujian`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
INSERT INTO `ujian` VALUES   ('2','MTK','a:1:{i:0;s:5:\"semua\";}','1','1','PTS','MTK','60','0','100','5','0','60','0','65','2020-06-05 19:00:00','2020-06-05 21:00:00','19:00:00',NULL,'semua','a:1:{i:0;s:5:\"semua\";}','2','0','1','1','1','70','0','','1');
