clc;
clear;
%22640311001
%Talat Furkan YILMAZ

ogrenciSayisi = input('Ogrenci sayisini giriniz: ');

toplam = 0;
enYuksek = -inf;
enDusuk = inf;

gecen = 0;
kalan = 0;
AA_sayisi = 0;
FF_sayisi = 0;

for i = 1:ogrenciSayisi
    
    fprintf('\n--- OGRENCI %d ---\n', i);
    
    ogrenciKod = input('Ogrenci kodu: ', 's');
    
    % KISA SINAV
    kisa = input('Kisa sinav: ');
    while kisa < 0 || kisa > 100
        fprintf('Hatali giris!\n');
        kisa = input('Tekrar giriniz: ');
    end
    
    % ARA SINAV
    ara = input('Ara sinav: ');
    while ara < 0 || ara > 100
        fprintf('Hatali giris!\n');
        ara = input('Tekrar giriniz: ');
    end
    
    % FINAL
    final = input('Final: ');
    while final < 0 || final > 100
        fprintf('Hatali giris!\n');
        final = input('Tekrar giriniz: ');
    end
    
    % BASARI PUANI
    basari = 0.20*kisa + 0.30*ara + 0.50*final;
    
    % HARF NOTU
    if basari >= 85
        harf = 'AA';
        AA_sayisi = AA_sayisi + 1;
    elseif basari >= 70
        harf = 'BB';
    elseif basari >= 60
        harf = 'CC';
    elseif basari >= 50
        harf = 'DD';
    else
        harf = 'FF';
        FF_sayisi = FF_sayisi + 1;
    end
    
    % GECTI / KALDI
    if basari >= 60 && final >= 50
        durum = 'GECTI';
        gecen = gecen + 1;
    else
        durum = 'KALDI';
        kalan = kalan + 1;
    end
    
    % ISTATISTIK
    toplam = toplam + basari;
    
    if basari > enYuksek
        enYuksek = basari;
    end
    
    if basari < enDusuk
        enDusuk = basari;
    end
    
    % YAZDIRMA
    fprintf('Ogrenci Kodu: %s\n', ogrenciKod);
    fprintf('Kisa: %.2f\nAra: %.2f\nFinal: %.2f\n', kisa, ara, final);
    fprintf('Basari Puani: %.2f\n', basari);
    fprintf('Harf Notu: %s\n', harf);
    fprintf('Durum: %s\n', durum);
end

% SINIF OZETI
ortalama = toplam / ogrenciSayisi;

fprintf('\n--- SINIF OZETI ---\n');
fprintf('Sinif Ortalamasi: %.2f\n', ortalama);
fprintf('En Yuksek: %.2f\n', enYuksek);
fprintf('En Dusuk: %.2f\n', enDusuk);
fprintf('Gecen: %d\n', gecen);
fprintf('Kalan: %d\n', kalan);
fprintf('AA Sayisi: %d\n', AA_sayisi);
fprintf('FF Sayisi: %d\n', FF_sayisi);