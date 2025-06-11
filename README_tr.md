# Film ve Dizi Takip Sistemi - SQL Ödevi

Bu proje, bir film ve dizi takip sisteminin temel veritabanı şemasını ve çeşitli SQL sorgularını içeren bir **SQL ödevidir**. `homework.sql` dosyasında tablo oluşturma, veri ekleme, temel ve ileri düzey SQL sorguları, görünümler (views) ve veri manipülasyon işlemleri (DML) örnekleri bulunmaktadır.

## İçerik

- [Kurulum](#kurulum)
- [Tablo Yapısı](#tablo-yapısı)
- [Veri Ekleme](#veri-ekleme)
- [Sorgu Örnekleri](#sorgu-örnekleri)
- [Görünümler (Views)](#görünümler-views)
- [Küme Operatörleri](#küme-operatörleri)
- [Veri Manipülasyonu (DML)](#veri-manipülasyonu-dml)
- [Notlar](#notlar)

---

## Kurulum

1. Bir PostgreSQL veritabanı oluşturun.
2. `homework.sql` dosyasını veritabanınıza çalıştırın:
   ```sh
   psql -U <kullanıcı_adı> -d <veritabanı_adı> -f homework.sql
   ```

## Tablo Yapısı

Aşağıdaki tablolar oluşturulmaktadır:

- **Users**: Kullanıcı bilgileri (kullanıcı adı, e-posta, şifre)
- **Contents**: İçerik bilgileri (film/dizi adı, açıklama, yıl, tür)
- **Genres**: Türler (aksiyon, dram, vb.)
- **ContentGenres**: İçerik-tür eşleştirmeleri (çoktan çoğa ilişki)
- **SeriesSeasons**: Dizilerin sezonları
- **Episodes**: Dizi bölümleri
- **WatchStatus**: Kullanıcıların izleme durumları
- **Ratings**: Kullanıcıların içeriklere verdiği puanlar
- **Comments**: Kullanıcı yorumları

## Veri Ekleme

Tablolara örnek kullanıcılar, içerikler, türler, sezonlar, bölümler, izleme durumları, puanlar ve yorumlar eklenmiştir.

## Sorgu Örnekleri

Dosyada aşağıdaki türde SQL sorguları örnek olarak yer almaktadır:

- **Basit Seçimler**: Kullanıcıları, içerikleri, izleme durumlarını listeleme
- **Aggregate Fonksiyonları**: Toplam kullanıcı sayısı, ortalama puan, en erken/son içerik yılı
- **Gruplama (GROUP BY)**: Türlere göre içerik sayısı, izlenme sayısı
- **Birleştirme (JOIN)**: Kullanıcı, içerik ve puan bilgilerini birleştirme
- **Alt Sorgular (Subqueries)**: Belirli kriterlere göre içerik veya kullanıcı seçimi

## Görünümler (Views)

- **HighlyRatedContents**: Ortalama puanı 8 ve üzeri olan içerikler
- **UserCommentSummary**: Kullanıcıların toplam yorum sayıları

## Küme Operatörleri

- **UNION**: Film ve dizileri tekrar etmeden birleştirir
- **INTERSECT**: Belirli yıllarda hem film hem dizi olan içerikler
- **EXCEPT**: Belirli yıllardan önce çıkan ve dizi olmayan içerikler

## Veri Manipülasyonu (DML)

- **UPDATE**: Kullanıcı puanını güncelleme
- **DELETE**: Belirli izleme kayıtlarını silme

## Notlar

- Bu dosya bir **ödev** kapsamında hazırlanmıştır.
- PostgreSQL uyumludur.
- Tablolar arası ilişkiler ve veri bütünlüğü için yabancı anahtarlar (foreign key) kullanılmıştır.
- Sorgular ve veri örnekleri, sistemin temel işlevlerini göstermek amacıyla hazırlanmıştır.
- **Proje raporu PDF olarak sunulmuştur ve Türkçedir.**

---

Herhangi bir sorunuz olursa, dosya üzerindeki açıklamaları inceleyebilir veya danışabilirsiniz.
