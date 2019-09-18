/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     08/08/2018 22.02.00                          */
/*==============================================================*/


drop index if exists rel_bay_lok_fk;

drop index if exists rel_bay_group_fk;

drop index if exists bay_pk;

drop table IF EXISTS  bay cascade;

drop index if exists dokumen_kerja_pk;

drop table IF EXISTS  ref.dokumen_kerja cascade;

drop index if exists rel_dok_acuan_pkrjaan_fk;

drop index if exists rel_jnsdok_kerja_diacu_fk;

drop index if exists dokumen_kerja_acuan_pk;

drop table IF EXISTS  dokumen_kerja_acuan cascade;

drop index if exists rel_dftr_foto_pkrjaan_fk;

drop index if exists rel_sesi_pekerjaan_fk;

drop index if exists rel_foto_tahapan_pekerjaan_fk;

drop index if exists foto_pekerjaan_pk;

drop table IF EXISTS  foto_pekerjaan cascade;

drop index if exists group_bay_pk;

drop table IF EXISTS  ref.group_bay cascade;

drop index if exists jenis_aksi_pk;

drop table IF EXISTS  ref.jenis_aksi cascade;

drop index if exists jenis_konstruksi_tiang_pk;

drop table IF EXISTS  ref.jenis_konstruksi_tiang cascade;

drop index if exists jenis_pekerjaan_pk;

drop table IF EXISTS  ref.jenis_pekerjaan cascade;

drop index if exists rel_kegunaan_fk;

drop index if exists jenis_peralatan_pk;

drop table IF EXISTS  ref.jenis_peralatan cascade;

drop index if exists jenis_tiang_pk;

drop table IF EXISTS  ref.jenis_tiang cascade;

drop index if exists jenis_tugas_pk;

drop table IF EXISTS  ref.jenis_tugas cascade;

drop index if exists kegunaan_peralatan_pk;

drop table IF EXISTS  ref.kegunaan_peralatan cascade;

drop index if exists rel_parent_lembaga_fk;

drop index if exists lembaga_pk;

drop table IF EXISTS  lembaga cascade;

drop index if exists rel_lok_lembaga_fk;

drop index if exists lokasi_pk;

drop table IF EXISTS  lokasi cascade;

drop index if exists metode_kerja_pk;

drop table IF EXISTS  ref.metode_kerja cascade;

drop index if exists rel_plksn_pkrjaan_fk;

drop index if exists rel_metode_kerja_fk;

drop index if exists rel_jenis_konstruksi_tiang_fk;

drop index if exists rel_jenis_tiang_fk;

drop index if exists rel_pekerjaan_bay_fk;

drop index if exists rel_pekerjaan_lokasi_fk;

drop index if exists rel_pekerjaan_jenis_fk;

drop index if exists rel_pemilik_aset_fk;

drop index if exists rel_stat_pek_trakhir_fk;

drop index if exists pekerjaan_pk;

drop table IF EXISTS  pekerjaan cascade;

drop index if exists rel_pengguna_lembaga_fk;

drop index if exists rel_peran_pengguna_fk;

drop index if exists pengguna_pk;

drop table IF EXISTS  pengguna cascade;

drop index if exists rel_pngsn_prsn_jns_tugas_fk;

drop index if exists rel_rinci_pnugasan_fk;

drop index if exists rel_pek_pnugasan_prsonil_fk;

drop index if exists penugasan_personil_pk;

drop table IF EXISTS  penugasan_personil cascade;

drop index if exists rel_jenis_peralatan_id_fk;

drop index if exists peralatan_pk;

drop table IF EXISTS  peralatan cascade;

drop index if exists rel_peralatan_terpakai_fk;

drop index if exists rel_alat_dipakai_fk;

drop index if exists peralatanterpakai_pk;

drop table IF EXISTS  peralatanterpakai cascade;

drop index if exists peran_pk;

drop table IF EXISTS  ref.peran cascade;

drop index if exists rel_personil_lembaga_fk;

drop index if exists personil_pk;

drop table IF EXISTS  personil cascade;

drop index if exists sesi_pekerjaan_pk;

drop table IF EXISTS  ref.sesi_pekerjaan cascade;

drop index if exists status_pekerjaan_pk;

drop table IF EXISTS  ref.status_pekerjaan cascade;

drop index if exists tahapan_pekerjaan_pk;

drop table IF EXISTS  ref.tahapan_pekerjaan cascade;

drop index if exists rel_trnsi_sts_jns_aksi_fk;

drop index if exists rel_pelaku_aksi_fk;

drop index if exists rel_st_ssdh_fk;

drop index if exists rel_st_sblm_fk;

drop index if exists rel_pek_transisi_status_fk;

drop index if exists transisi_status_pk;

drop table IF EXISTS  transisi_status cascade;

drop schema if exists ref;

/*==============================================================*/
/* User: ref                                                    */
/*==============================================================*/
create schema ref;

/*==============================================================*/
/* Table: bay                                                   */
/*==============================================================*/
create table bay (
   bay_id               VARCHAR(11)          not null,
   lokasi_id            VARCHAR(7)           not null,
   group_bay_id         INT4                 not null,
   nama_bay             VARCHAR(40)          null,
   constraint PK_BAY primary key (bay_id)
);

/*==============================================================*/
/* Index: bay_pk                                                */
/*==============================================================*/
create unique index bay_pk on bay  (
bay_id
);

/*==============================================================*/
/* Index: rel_bay_group_fk                                      */
/*==============================================================*/
create  index rel_bay_group_fk on bay  (
group_bay_id
);

/*==============================================================*/
/* Index: rel_bay_lok_fk                                        */
/*==============================================================*/
create  index rel_bay_lok_fk on bay  (
lokasi_id
);

/*==============================================================*/
/* Table: dokumen_kerja                                         */
/*==============================================================*/
create table ref.dokumen_kerja (
   dokumen_kerja_id     INT4                 not null,
   jenis_dokumen_kerja  VARCHAR(40)          null,
   nomor                VARCHAR(50)          null,
   nama_dokumen_kerja   VARCHAR(250)         null,
   constraint PK_DOKUMEN_KERJA primary key (dokumen_kerja_id)
);

/*==============================================================*/
/* Index: dokumen_kerja_pk                                      */
/*==============================================================*/
create unique index dokumen_kerja_pk on ref.dokumen_kerja  (
dokumen_kerja_id
);

/*==============================================================*/
/* Table: dokumen_kerja_acuan                                   */
/*==============================================================*/
create table dokumen_kerja_acuan (
   pekerjaan_id         INT4                 not null,
   dokumen_kerja_id     INT4                 not null,
   jenis_dokumen        INT4                 null,
   constraint PK_DOKUMEN_KERJA_ACUAN primary key (pekerjaan_id, dokumen_kerja_id)
);

/*==============================================================*/
/* Index: dokumen_kerja_acuan_pk                                */
/*==============================================================*/
create unique index dokumen_kerja_acuan_pk on dokumen_kerja_acuan  (
pekerjaan_id,
dokumen_kerja_id
);

/*==============================================================*/
/* Index: rel_jnsdok_kerja_diacu_fk                             */
/*==============================================================*/
create  index rel_jnsdok_kerja_diacu_fk on dokumen_kerja_acuan  (
dokumen_kerja_id
);

/*==============================================================*/
/* Index: rel_dok_acuan_pkrjaan_fk                              */
/*==============================================================*/
create  index rel_dok_acuan_pkrjaan_fk on dokumen_kerja_acuan  (
pekerjaan_id
);

/*==============================================================*/
/* Table: foto_pekerjaan                                        */
/*==============================================================*/
create table foto_pekerjaan (
   foto_id              uuid                 not null,
   tahapan_pekerjaan_id INT4                 null,
   sesi_pekerjaan_id    INT4                 null,
   pekerjaan_id         INT4                 null,
   judul_foto           VARCHAR(200)         null,
   waktu_foto           DATE                 null,
   lokasi_lintang_foto  FLOAT8               null,
   lokasi_bujur_foto    FLOAT8               null,
   cara_upload_foto     INT4                 null,
   relative_path        VARCHAR(250)         null,
   waktu_upload         DATE                 null,
   constraint PK_FOTO_PEKERJAAN primary key (foto_id)
);

/*==============================================================*/
/* Index: foto_pekerjaan_pk                                     */
/*==============================================================*/
create unique index foto_pekerjaan_pk on foto_pekerjaan  (
foto_id
);

/*==============================================================*/
/* Index: rel_foto_tahapan_pekerjaan_fk                         */
/*==============================================================*/
create  index rel_foto_tahapan_pekerjaan_fk on foto_pekerjaan  (
tahapan_pekerjaan_id
);

/*==============================================================*/
/* Index: rel_sesi_pekerjaan_fk                                 */
/*==============================================================*/
create  index rel_sesi_pekerjaan_fk on foto_pekerjaan  (
sesi_pekerjaan_id
);

/*==============================================================*/
/* Index: rel_dftr_foto_pkrjaan_fk                              */
/*==============================================================*/
create  index rel_dftr_foto_pkrjaan_fk on foto_pekerjaan  (
pekerjaan_id
);

/*==============================================================*/
/* Table: group_bay                                             */
/*==============================================================*/
create table ref.group_bay (
   group_bay_id         INT4                 not null,
   nama_group_bay       VARCHAR(40)          null,
   constraint PK_GROUP_BAY primary key (group_bay_id)
);

/*==============================================================*/
/* Index: group_bay_pk                                          */
/*==============================================================*/
create unique index group_bay_pk on ref.group_bay  (
group_bay_id
);

/*==============================================================*/
/* Table: jenis_aksi                                            */
/*==============================================================*/
create table ref.jenis_aksi (
   jenis_aksi_id        INT4                 not null,
   kode                 VARCHAR(40)          null,
   nama_jenis_aksi      VARCHAR(250)         null,
   opsi1                VARCHAR(40)          null,
   status_opsi1         INT4                 null,
   next_aksi_opsi_1     INT4                 null,
   opsi2                VARCHAR(40)          null,
   status_opsi2         INT4                 null,
   next_aksi_opsi_2     INT4                 null,
   constraint PK_JENIS_AKSI primary key (jenis_aksi_id)
);

/*==============================================================*/
/* Index: jenis_aksi_pk                                         */
/*==============================================================*/
create unique index jenis_aksi_pk on ref.jenis_aksi  (
jenis_aksi_id
);

/*==============================================================*/
/* Table: jenis_konstruksi_tiang                                */
/*==============================================================*/
create table ref.jenis_konstruksi_tiang (
   jenis_konstruksi_tiang_id INT4                 not null,
   nama_jenis_konstruksi_tiang VARCHAR(40)          null,
   constraint PK_JENIS_KONSTRUKSI_TIANG primary key (jenis_konstruksi_tiang_id)
);

/*==============================================================*/
/* Index: jenis_konstruksi_tiang_pk                             */
/*==============================================================*/
create unique index jenis_konstruksi_tiang_pk on ref.jenis_konstruksi_tiang  (
jenis_konstruksi_tiang_id
);

/*==============================================================*/
/* Table: jenis_pekerjaan                                       */
/*==============================================================*/
create table ref.jenis_pekerjaan (
   jenis_pekerjaan_id   INT4                 not null,
   nama_jenis_pekerjaan VARCHAR(40)          null,
   constraint PK_JENIS_PEKERJAAN primary key (jenis_pekerjaan_id)
);

/*==============================================================*/
/* Index: jenis_pekerjaan_pk                                    */
/*==============================================================*/
create unique index jenis_pekerjaan_pk on ref.jenis_pekerjaan  (
jenis_pekerjaan_id
);

/*==============================================================*/
/* Table: jenis_peralatan                                       */
/*==============================================================*/
create table ref.jenis_peralatan (
   jenis_peralatan_id   INT4                 not null,
   kegunaan_peralatan_id INT4                 not null,
   nama_jenis_peralatan VARCHAR(250)         null,
   spek                 VARCHAR(250)         null,
   satuan               VARCHAR(40)          null,
   constraint PK_JENIS_PERALATAN primary key (jenis_peralatan_id)
);

/*==============================================================*/
/* Index: jenis_peralatan_pk                                    */
/*==============================================================*/
create unique index jenis_peralatan_pk on ref.jenis_peralatan  (
jenis_peralatan_id
);

/*==============================================================*/
/* Index: rel_kegunaan_fk                                       */
/*==============================================================*/
create  index rel_kegunaan_fk on ref.jenis_peralatan  (
kegunaan_peralatan_id
);

/*==============================================================*/
/* Table: jenis_tiang                                           */
/*==============================================================*/
create table ref.jenis_tiang (
   jenis_tiang_id       INT4                 not null,
   nama_jenis_tiang     VARCHAR(40)          null,
   constraint PK_JENIS_TIANG primary key (jenis_tiang_id)
);

/*==============================================================*/
/* Index: jenis_tiang_pk                                        */
/*==============================================================*/
create unique index jenis_tiang_pk on ref.jenis_tiang  (
jenis_tiang_id
);

/*==============================================================*/
/* Table: jenis_tugas                                           */
/*==============================================================*/
create table ref.jenis_tugas (
   jenis_tugas_id       INT4                 not null,
   nama_jenis_tugas     VARCHAR(40)          null,
   constraint PK_JENIS_TUGAS primary key (jenis_tugas_id)
);

/*==============================================================*/
/* Index: jenis_tugas_pk                                        */
/*==============================================================*/
create unique index jenis_tugas_pk on ref.jenis_tugas  (
jenis_tugas_id
);

/*==============================================================*/
/* Table: kegunaan_peralatan                                    */
/*==============================================================*/
create table ref.kegunaan_peralatan (
   kegunaan_peralatan_id INT4                 not null,
   nama_kegunaan_peralatan VARCHAR(40)          null,
   constraint PK_KEGUNAAN_PERALATAN primary key (kegunaan_peralatan_id)
);

/*==============================================================*/
/* Index: kegunaan_peralatan_pk                                 */
/*==============================================================*/
create unique index kegunaan_peralatan_pk on ref.kegunaan_peralatan  (
kegunaan_peralatan_id
);

/*==============================================================*/
/* Table: lembaga                                               */
/*==============================================================*/
create table lembaga (
   lembaga_id           CHAR(8)              not null,
   parent_lembaga_id    CHAR(8)              null,
   nama_lembaga         VARCHAR(70)          null,
   constraint PK_LEMBAGA primary key (lembaga_id)
);

/*==============================================================*/
/* Index: lembaga_pk                                            */
/*==============================================================*/
create unique index lembaga_pk on lembaga  (
lembaga_id
);

/*==============================================================*/
/* Index: rel_parent_lembaga_fk                                 */
/*==============================================================*/
create  index rel_parent_lembaga_fk on lembaga  (
parent_lembaga_id
);

/*==============================================================*/
/* Table: lokasi                                                */
/*==============================================================*/
create table lokasi (
   lokasi_id            VARCHAR(7)           not null,
   lembaga_id           CHAR(8)              null,
   nomor_lokasi         VARCHAR(50)          null,
   nama_lokasi          VARCHAR(70)          null,
   tegangan             VARCHAR(40)          null,
   alamat               TEXT                 null,
   jenis_lokasi         INT4                 null,
   constraint PK_LOKASI primary key (lokasi_id)
);

/*==============================================================*/
/* Index: lokasi_pk                                             */
/*==============================================================*/
create unique index lokasi_pk on lokasi  (
lokasi_id
);

/*==============================================================*/
/* Index: rel_lok_lembaga_fk                                    */
/*==============================================================*/
create  index rel_lok_lembaga_fk on lokasi  (
lembaga_id
);

/*==============================================================*/
/* Table: metode_kerja                                          */
/*==============================================================*/
create table ref.metode_kerja (
   metode_kerja_id      INT4                 not null,
   nama_metode_kerja    VARCHAR(40)          null,
   constraint PK_METODE_KERJA primary key (metode_kerja_id)
);

/*==============================================================*/
/* Index: metode_kerja_pk                                       */
/*==============================================================*/
create unique index metode_kerja_pk on ref.metode_kerja  (
metode_kerja_id
);

/*==============================================================*/
/* Table: pekerjaan                                             */
/*==============================================================*/
create table pekerjaan (
   pekerjaan_id         INT4                 not null,
   status_id            INT4                 not null,
   lembaga_pemilik_aset_id CHAR(8)              not null,
   jenis_pekerjaan_id   INT4                 not null,
   lokasi_id            VARCHAR(7)           not null,
   bay_id               VARCHAR(11)          null,
   jenis_tiang_id       INT4                 null,
   jenis_konstruksi_tiang_id INT4                 null,
   metode_kerja_id      INT4                 null,
   lembaga_pelaksana_id CHAR(8)              null,
   nomor_wo             VARCHAR(50)          null,
   tanggal_wo           DATE                 null,
   titik_pekerjaan      VARCHAR(250)         null,
   anomali              VARCHAR(300)         null,
   tanggal_anomali      DATE                 null,
   kapasitas_nominal    INT4                 null,
   tegangan_nominal     INT4                 null,
   arus                 INT4                 null,
   suhu_hotspot         DECIMAL(4,2)         null,
   keterangan           VARCHAR(500)         null,
   target_tgl_awal      DATE                 null,
   target_tgl_selesai   DATE                 null,
   target_jam_awal      TIME                 null,
   target_jam_selesai   TIME                 null,
   nomor_sp3b_jsa       VARCHAR(50)          null,
   tanggal_sp3b_jsa     DATE                 null,
   gi_tegangan          INT4                 null,
   gi_kondisi_lokasi    VARCHAR(40)          null,
   gi_peralatan_diperbaiki VARCHAR(40)          null,
   gi_phasa             VARCHAR(40)          null,
   gi_proteksi          VARCHAR(40)          null,
   gi_arus_nominal      INT4                 null,
   gi_arus_saat_ini     INT4                 null,
   gi_arus_max_tercapai INT4                 null,
   gi_daya              INT4                 null,
   gi_jarak_fasa_fasa   INT4                 null,
   gi_jarak_mobilisasi  INT4                 null,
   gi_jarak_fasa_ground INT4                 null,
   gi_tinggi_titik_pekerjaan INT4                 null,
   gi_jenis_konduktor   INT4                 null,
   gi_diameter          INT4                 null,
   jar_kondisi_lokasi   INT4                 null,
   jar_jarak_lokasi     INT4                 null,
   jar_nomor_tower      VARCHAR(40)          null,
   jar_penghantar       VARCHAR(40)          null,
   jar_konfigurasi_fasa VARCHAR(40)          null,
   jar_fasa             INT4                 null,
   jar_jumlah_string    INT4                 null,
   jar_string_rusak_fasa INT4                 null,
   jar_jumlah_isolator  INT4                 null,
   jar_jenis_isolator   VARCHAR(40)          null,
   jar_tipe_isolator    VARCHAR(40)          null,
   jar_jumlah_isolator_rusak INT4                 null,
   jar_jenis_konduktor  INT4                 null,
   jar_panjang_traves   INT4                 null,
   jar_panjang_isolator INT4                 null,
   jar_jarak_diagonal_traves INT4                 null,
   jar_jarak_konduktor_traves INT4                 null,
   jar_keterangan       INT4                 null,
   nomor_sp3b           VARCHAR(50)          null,
   tanggal_sp3b         DATE                 null,
   masa_berlaku_sp3b    INT4                 null,
   bap_material_pengganti VARCHAR(250)         null,
   bap_anomali_peralatan VARCHAR(250)         null,
   bap_uraian_pekerjaan TEXT                 null,
   bap_catatan          TEXT                 null,
   real_tgl_awal        DATE                 null,
   real_tgl_selesai     DATE                 null,
   real_jam_awal        TIME                 null,
   real_jam_selesai     TIME                 null,
   real_kapasitas_nominal INT4                 null,
   real_tegangan_nominal INT4                 null,
   real_beban           INT4                 null,
   real_arus            INT4                 null,
   real_suhu_sebelum    INT4                 null,
   real_suhu_sesudah    INT4                 null,
   real_keterangan      TEXT                 null,
   constraint PK_PEKERJAAN primary key (pekerjaan_id)
);

/*==============================================================*/
/* Index: pekerjaan_pk                                          */
/*==============================================================*/
create unique index pekerjaan_pk on pekerjaan  (
pekerjaan_id
);

/*==============================================================*/
/* Index: rel_stat_pek_trakhir_fk                               */
/*==============================================================*/
create  index rel_stat_pek_trakhir_fk on pekerjaan  (
status_id
);

/*==============================================================*/
/* Index: rel_pemilik_aset_fk                                   */
/*==============================================================*/
create  index rel_pemilik_aset_fk on pekerjaan  (
lembaga_pemilik_aset_id
);

/*==============================================================*/
/* Index: rel_pekerjaan_jenis_fk                                */
/*==============================================================*/
create  index rel_pekerjaan_jenis_fk on pekerjaan  (
jenis_pekerjaan_id
);

/*==============================================================*/
/* Index: rel_pekerjaan_lokasi_fk                               */
/*==============================================================*/
create  index rel_pekerjaan_lokasi_fk on pekerjaan  (
lokasi_id
);

/*==============================================================*/
/* Index: rel_pekerjaan_bay_fk                                  */
/*==============================================================*/
create  index rel_pekerjaan_bay_fk on pekerjaan  (
bay_id
);

/*==============================================================*/
/* Index: rel_jenis_tiang_fk                                    */
/*==============================================================*/
create  index rel_jenis_tiang_fk on pekerjaan  (
jenis_tiang_id
);

/*==============================================================*/
/* Index: rel_jenis_konstruksi_tiang_fk                         */
/*==============================================================*/
create  index rel_jenis_konstruksi_tiang_fk on pekerjaan  (
jenis_konstruksi_tiang_id
);

/*==============================================================*/
/* Index: rel_metode_kerja_fk                                   */
/*==============================================================*/
create  index rel_metode_kerja_fk on pekerjaan  (
metode_kerja_id
);

/*==============================================================*/
/* Index: rel_plksn_pkrjaan_fk                                  */
/*==============================================================*/
create  index rel_plksn_pkrjaan_fk on pekerjaan  (
lembaga_pelaksana_id
);

/*==============================================================*/
/* Table: pengguna                                              */
/*==============================================================*/
create table pengguna (
   pengguna_id          uuid                 not null,
   peran_id             INT4                 not null,
   lembaga_id           CHAR(8)              not null,
   username             VARCHAR(50)          null,
   password             VARCHAR(200)         null,
   nama_pengguna        VARCHAR(100)         null,
   email                VARCHAR(50)          null,
   no_hp                VARCHAR(15)          null,
   constraint PK_PENGGUNA primary key (pengguna_id)
);

/*==============================================================*/
/* Index: pengguna_pk                                           */
/*==============================================================*/
create unique index pengguna_pk on pengguna  (
pengguna_id
);

/*==============================================================*/
/* Index: rel_peran_pengguna_fk                                 */
/*==============================================================*/
create  index rel_peran_pengguna_fk on pengguna  (
peran_id
);

/*==============================================================*/
/* Index: rel_pengguna_lembaga_fk                               */
/*==============================================================*/
create  index rel_pengguna_lembaga_fk on pengguna  (
lembaga_id
);

/*==============================================================*/
/* Table: penugasan_personil                                    */
/*==============================================================*/
create table penugasan_personil (
   personil_id          INT4                 not null,
   pekerjaan_id         INT4                 not null,
   jenis_tugas_id       INT4                 not null,
   hadir                INT4                 null,
   kondisi_jasmani      INT4                 null,
   kondisi_rohani       INT4                 null,
   constraint PK_PENUGASAN_PERSONIL primary key (personil_id, pekerjaan_id)
);

/*==============================================================*/
/* Index: penugasan_personil_pk                                 */
/*==============================================================*/
create unique index penugasan_personil_pk on penugasan_personil  (
personil_id,
pekerjaan_id
);

/*==============================================================*/
/* Index: rel_pek_pnugasan_prsonil_fk                           */
/*==============================================================*/
create  index rel_pek_pnugasan_prsonil_fk on penugasan_personil  (
pekerjaan_id
);

/*==============================================================*/
/* Index: rel_rinci_pnugasan_fk                                 */
/*==============================================================*/
create  index rel_rinci_pnugasan_fk on penugasan_personil  (
personil_id
);

/*==============================================================*/
/* Index: rel_pngsn_prsn_jns_tugas_fk                           */
/*==============================================================*/
create  index rel_pngsn_prsn_jns_tugas_fk on penugasan_personil  (
jenis_tugas_id
);

/*==============================================================*/
/* Table: peralatan                                             */
/*==============================================================*/
create table peralatan (
   peralatan_id         INT4                 not null,
   jenis_peralatan_id   INT4                 not null,
   kondisi              INT4                 null,
   jam_terpakai         INT4                 null,
   constraint PK_PERALATAN primary key (peralatan_id)
);

/*==============================================================*/
/* Index: peralatan_pk                                          */
/*==============================================================*/
create unique index peralatan_pk on peralatan  (
peralatan_id
);

/*==============================================================*/
/* Index: rel_jenis_peralatan_id_fk                             */
/*==============================================================*/
create  index rel_jenis_peralatan_id_fk on peralatan  (
jenis_peralatan_id
);

/*==============================================================*/
/* Table: peralatanterpakai                                     */
/*==============================================================*/
create table peralatanterpakai (
   pekerjaan_id         INT4                 not null,
   peralatan_id         INT4                 not null,
   kondisi_sebelum      INT4                 null,
   kondisi_sesudah      INT4                 null,
   constraint PK_PERALATANTERPAKAI primary key (pekerjaan_id, peralatan_id)
);

/*==============================================================*/
/* Index: peralatanterpakai_pk                                  */
/*==============================================================*/
create unique index peralatanterpakai_pk on peralatanterpakai  (
pekerjaan_id,
peralatan_id
);

/*==============================================================*/
/* Index: rel_alat_dipakai_fk                                   */
/*==============================================================*/
create  index rel_alat_dipakai_fk on peralatanterpakai  (
peralatan_id
);

/*==============================================================*/
/* Index: rel_peralatan_terpakai_fk                             */
/*==============================================================*/
create  index rel_peralatan_terpakai_fk on peralatanterpakai  (
pekerjaan_id
);

/*==============================================================*/
/* Table: peran                                                 */
/*==============================================================*/
create table ref.peran (
   peran_id             INT4                 not null,
   nama_peran           VARCHAR(40)          null,
   constraint PK_PERAN primary key (peran_id)
);

/*==============================================================*/
/* Index: peran_pk                                              */
/*==============================================================*/
create unique index peran_pk on ref.peran  (
peran_id
);

/*==============================================================*/
/* Table: personil                                              */
/*==============================================================*/
create table personil (
   personil_id          INT4                 not null,
   lembaga_id           CHAR(8)              not null,
   nip                  VARCHAR(50)          null,
   nama_personil        VARCHAR(100)         null,
   jabatan              VARCHAR(40)          null,
   grade                VARCHAR(40)          null,
   constraint PK_PERSONIL primary key (personil_id)
);

/*==============================================================*/
/* Index: personil_pk                                           */
/*==============================================================*/
create unique index personil_pk on personil  (
personil_id
);

/*==============================================================*/
/* Index: rel_personil_lembaga_fk                               */
/*==============================================================*/
create  index rel_personil_lembaga_fk on personil  (
lembaga_id
);

/*==============================================================*/
/* Table: sesi_pekerjaan                                        */
/*==============================================================*/
create table ref.sesi_pekerjaan (
   sesi_pekerjaan_id    INT4                 not null,
   nama_sesi_pekerjaan  VARCHAR(40)          null,
   constraint PK_SESI_PEKERJAAN primary key (sesi_pekerjaan_id)
);

/*==============================================================*/
/* Index: sesi_pekerjaan_pk                                     */
/*==============================================================*/
create unique index sesi_pekerjaan_pk on ref.sesi_pekerjaan  (
sesi_pekerjaan_id
);

/*==============================================================*/
/* Table: status_pekerjaan                                      */
/*==============================================================*/
create table ref.status_pekerjaan (
   status_id            INT4                 not null,
   nama_status          VARCHAR(40)          null,
   constraint PK_STATUS_PEKERJAAN primary key (status_id)
);

/*==============================================================*/
/* Index: status_pekerjaan_pk                                   */
/*==============================================================*/
create unique index status_pekerjaan_pk on ref.status_pekerjaan  (
status_id
);

/*==============================================================*/
/* Table: tahapan_pekerjaan                                     */
/*==============================================================*/
create table ref.tahapan_pekerjaan (
   tahapan_pekerjaan_id INT4                 not null,
   nama_tahapan_pekerjaan VARCHAR(40)          null,
   constraint PK_TAHAPAN_PEKERJAAN primary key (tahapan_pekerjaan_id)
);

/*==============================================================*/
/* Index: tahapan_pekerjaan_pk                                  */
/*==============================================================*/
create unique index tahapan_pekerjaan_pk on ref.tahapan_pekerjaan  (
tahapan_pekerjaan_id
);

/*==============================================================*/
/* Table: transisi_status                                       */
/*==============================================================*/
create table transisi_status (
   transisi_status_id   INT4                 not null,
   pekerjaan_id         INT4                 not null,
   status_sebelum_id    INT4                 not null,
   status_sesudah_id    INT4                 not null,
   pengguna_id          uuid                 not null,
   jenis_aksi_id        INT4                 not null,
   waktu_aksi           DATE                 null,
   deskripsi            VARCHAR(255)         null,
   constraint PK_TRANSISI_STATUS primary key (transisi_status_id)
);

/*==============================================================*/
/* Index: transisi_status_pk                                    */
/*==============================================================*/
create unique index transisi_status_pk on transisi_status  (
transisi_status_id
);

/*==============================================================*/
/* Index: rel_pek_transisi_status_fk                            */
/*==============================================================*/
create  index rel_pek_transisi_status_fk on transisi_status  (
pekerjaan_id
);

/*==============================================================*/
/* Index: rel_st_sblm_fk                                        */
/*==============================================================*/
create  index rel_st_sblm_fk on transisi_status  (
status_sebelum_id
);

/*==============================================================*/
/* Index: rel_st_ssdh_fk                                        */
/*==============================================================*/
create  index rel_st_ssdh_fk on transisi_status  (
status_sesudah_id
);

/*==============================================================*/
/* Index: rel_pelaku_aksi_fk                                    */
/*==============================================================*/
create  index rel_pelaku_aksi_fk on transisi_status  (
pengguna_id
);

/*==============================================================*/
/* Index: rel_trnsi_sts_jns_aksi_fk                             */
/*==============================================================*/
create  index rel_trnsi_sts_jns_aksi_fk on transisi_status  (
jenis_aksi_id
);

alter table  bay
   add constraint FK_BAY_REL_BAY_G_GROUP_BA foreign key (group_bay_id)
      references  ref.group_bay (group_bay_id)
      on delete restrict on update restrict;

alter table  bay
   add constraint FK_BAY_REL_BAY_L_LOKASI foreign key (lokasi_id)
      references  lokasi (lokasi_id)
      on delete restrict on update restrict;

alter table  dokumen_kerja_acuan
   add constraint FK_DOKUMEN__REL_DOK_A_PEKERJAA foreign key (pekerjaan_id)
      references  pekerjaan (pekerjaan_id)
      on delete restrict on update restrict;

alter table  dokumen_kerja_acuan
   add constraint FK_DOKUMEN__REL_JNSDO_DOKUMEN_ foreign key (dokumen_kerja_id)
      references  ref.dokumen_kerja (dokumen_kerja_id)
      on delete restrict on update restrict;

alter table  foto_pekerjaan
   add constraint FK_FOTO_PEK_REL_DFTR__PEKERJAA foreign key (pekerjaan_id)
      references  pekerjaan (pekerjaan_id)
      on delete restrict on update restrict;

alter table  foto_pekerjaan
   add constraint FK_FOTO_PEK_REL_FOTO__TAHAPAN_ foreign key (tahapan_pekerjaan_id)
      references  ref.tahapan_pekerjaan (tahapan_pekerjaan_id)
      on delete restrict on update restrict;

alter table  foto_pekerjaan
   add constraint FK_FOTO_PEK_REL_SESI__SESI_PEK foreign key (sesi_pekerjaan_id)
      references  ref.sesi_pekerjaan (sesi_pekerjaan_id)
      on delete restrict on update restrict;

alter table  ref.jenis_peralatan
   add constraint FK_JENIS_PE_REL_KEGUN_KEGUNAAN foreign key (kegunaan_peralatan_id)
      references  ref.kegunaan_peralatan (kegunaan_peralatan_id)
      on delete restrict on update restrict;

alter table  lembaga
   add constraint FK_LEMBAGA_REL_PAREN_LEMBAGA foreign key (parent_lembaga_id)
      references  lembaga (lembaga_id)
      on delete restrict on update restrict;

alter table  lokasi
   add constraint FK_LOKASI_REL_LOK_L_LEMBAGA foreign key (lembaga_id)
      references  lembaga (lembaga_id)
      on delete restrict on update restrict;

alter table  pekerjaan
   add constraint FK_PEKERJAA_REL_JENIS_JENIS_KO foreign key (jenis_konstruksi_tiang_id)
      references  ref.jenis_konstruksi_tiang (jenis_konstruksi_tiang_id)
      on delete restrict on update restrict;

alter table  pekerjaan
   add constraint FK_PEKERJAA_REL_JENIS_JENIS_TI foreign key (jenis_tiang_id)
      references  ref.jenis_tiang (jenis_tiang_id)
      on delete restrict on update restrict;

alter table  pekerjaan
   add constraint FK_PEKERJAA_REL_METOD_METODE_K foreign key (metode_kerja_id)
      references  ref.metode_kerja (metode_kerja_id)
      on delete restrict on update restrict;

alter table  pekerjaan
   add constraint FK_PEKERJAA_REL_PEKER_BAY foreign key (bay_id)
      references  bay (bay_id)
      on delete restrict on update restrict;

alter table  pekerjaan
   add constraint FK_PEKERJAA_REL_PEKER_JENIS_PE foreign key (jenis_pekerjaan_id)
      references  ref.jenis_pekerjaan (jenis_pekerjaan_id)
      on delete restrict on update restrict;

alter table  pekerjaan
   add constraint FK_PEKERJAA_REL_PEKER_LOKASI foreign key (lokasi_id)
      references  lokasi (lokasi_id)
      on delete restrict on update restrict;

alter table  pekerjaan
   add constraint FK_PEKERJAA_REL_PEMIL_LEMBAGA foreign key (lembaga_pemilik_aset_id)
      references  lembaga (lembaga_id)
      on delete restrict on update restrict;

alter table  pekerjaan
   add constraint FK_PEKERJAA_REL_PLKSN_LEMBAGA foreign key (lembaga_pelaksana_id)
      references  lembaga (lembaga_id)
      on delete restrict on update restrict;

alter table  pekerjaan
   add constraint FK_PEKERJAA_REL_STAT__STATUS_P foreign key (status_id)
      references  ref.status_pekerjaan (status_id)
      on delete restrict on update restrict;

alter table  pengguna
   add constraint FK_PENGGUNA_REL_PENGG_LEMBAGA foreign key (lembaga_id)
      references  lembaga (lembaga_id)
      on delete restrict on update restrict;

alter table  pengguna
   add constraint FK_PENGGUNA_REL_PERAN_PERAN foreign key (peran_id)
      references  ref.peran (peran_id)
      on delete restrict on update restrict;

alter table  penugasan_personil
   add constraint FK_PENUGASA_REL_PEK_P_PEKERJAA foreign key (pekerjaan_id)
      references  pekerjaan (pekerjaan_id)
      on delete restrict on update restrict;

alter table  penugasan_personil
   add constraint FK_PENUGASA_REL_PNGSN_JENIS_TU foreign key (jenis_tugas_id)
      references  ref.jenis_tugas (jenis_tugas_id)
      on delete restrict on update restrict;

alter table  penugasan_personil
   add constraint FK_PENUGASA_REL_RINCI_PERSONIL foreign key (personil_id)
      references  personil (personil_id)
      on delete restrict on update restrict;

alter table  peralatan
   add constraint FK_PERALATA_REL_JENIS_JENIS_PE foreign key (jenis_peralatan_id)
      references  ref.jenis_peralatan (jenis_peralatan_id)
      on delete restrict on update restrict;

alter table  peralatanterpakai
   add constraint FK_PERALATA_REL_ALAT__PERALATA foreign key (peralatan_id)
      references  peralatan (peralatan_id)
      on delete restrict on update restrict;

alter table  peralatanterpakai
   add constraint FK_PERALATA_REL_PERAL_PEKERJAA foreign key (pekerjaan_id)
      references  pekerjaan (pekerjaan_id)
      on delete restrict on update restrict;

alter table  personil
   add constraint FK_PERSONIL_REL_PERSO_LEMBAGA foreign key (lembaga_id)
      references  lembaga (lembaga_id)
      on delete restrict on update restrict;

alter table  transisi_status
   add constraint FK_TRANSISI_REL_PEK_T_PEKERJAA foreign key (pekerjaan_id)
      references  pekerjaan (pekerjaan_id)
      on delete restrict on update restrict;

alter table  transisi_status
   add constraint FK_TRANSISI_REL_PELAK_PENGGUNA foreign key (pengguna_id)
      references  pengguna (pengguna_id)
      on delete restrict on update restrict;

alter table  transisi_status
   add constraint FK_TRANSISI_REL_ST_SB_STATUS_P foreign key (status_sebelum_id)
      references  ref.status_pekerjaan (status_id)
      on delete restrict on update restrict;

alter table  transisi_status
   add constraint FK_TRANSISI_REL_ST_SS_STATUS_P foreign key (status_sesudah_id)
      references  ref.status_pekerjaan (status_id)
      on delete restrict on update restrict;

alter table  transisi_status
   add constraint FK_TRANSISI_REL_TRNSI_JENIS_AK foreign key (jenis_aksi_id)
      references  ref.jenis_aksi (jenis_aksi_id)
      on delete restrict on update restrict;

