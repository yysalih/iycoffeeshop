const Map<String, Map<String, String>> languages = {
  "tr": tr,
  "en": en,
  "ar": ar,
};

const Map<String, String> tr = {
  "go_home" : "Ana Menüye Git",
  "success_adding_in_basket" : "Ürün sepete eklendi",
  "success_creating_order" : "Sipariş verildi.",
  "error_creating_order" : "Sipariş verilirken bir hata oluştu.",
  "no_product_found" : "Ürün bulunamadı",
  "switch_theme" : "Tema Değiştir",
  "saved_cards" : "Kayıtlı Kartlar",
  "basket" : "Sepet",
  "order" : "Sipariş Ver",
  "latte_description" : "Latte, espresso ve buharda pişirilmiş süt ile hazırlanan bir kahve içeceğidir. Genellikle az miktarda köpükle süslenir.",
  "americano_description" : "Amerikano, espresso'nun sıcak suyla seyreltilmesiyle hazırlanan bir kahve içeceğidir ve damla kahveye benzer bir güce sahiptir ancak farklı bir lezzet profiline sahiptir.",
  "mocha_description" : "Mocha, çikolata aromalı bir latté'dir. Genellikle espresso, buharda pişirilmiş süt, çikolata şurubu ve krem şanti ile yapılır.",
  "espresso_description" : "Espresso, ince öğütülmüş kahveden yüksek basınç altında sıcak su geçirilerek demlenen konsantre bir kahve türüdür.",
  "welcome" : "Hoşgeldin",
  "all_products" : "Tüm Ürünler",
  "most_popular" : "En Popüler Kahveler",
  "latte" : "Latte" ,
  "americano" : "Americano" ,
  "mocha" : "Mocha",
  "espresso" : "Espresso",
  "coffee" : "Kahve",
  "tea" : "Çay",
  "food" : "Yiyecek",
  "the_best_int_town" : "Şehrinin En iyisi",
  "profile_view" : "Profil",
  "shop_view" : "Mağaza",
  "card_view" : "Sepet",
  "show" : "Görüntüle",
  "offer_accepted_load_title": "yükü için teklifiniz kabul edildi",
  "offer_accepted_truck_title": "aracı için teklifiniz kabul edildi",
  "offer_accepted_body": "Teklifiniz kabul edildi.",
  "new_offer_load_body": "Yükünüz için yeni bir teklif geldi",
  "new_offer_truck_body": "Aracınız için yeni bir teklif geldi",
  "new_offer_load_title": "yükü için yeni bir teklif geldi",
  "new_offer_truck_title": "aracı için yeni bir teklif geldi",
  "shipment_canceled_body": "Nakliyat iptal edildi",
  "shipment_completed_body": "Nakliyat tamamlandı!",
  "new_message_title": "sana yeni bir mesaj gönderdi",
  "anonymous_login": "Misafir Olarak Devam Et",
  "pick_load": "Yük Seç",
  "truck_post_details": "Araç İlan Detayları",
  "propose": "Teklif",
  "update_shipment_state": "Nakliyat Durumunu Güncelle",
  "load_received": "Yük Alındı",
  "target_reached": "Hedefe Ulaşıldı",
  "load_delivered": "Yük Teslim Edildi",
  "load_owner": "Yük Sahibi",
  "this_shipment_is_canceled": "Bu nakliyat iptal edildi!",
  "this_shipment_is_completed": "Bu nakliyat tamamlandı.",
  "complete": "Bitir",
  "error_cancel_shipment": "Nakliyat iptal edilirken bir hata oluştu!",
  "success_cancel_shipment": "Nakliyat başarıyla iptal edildi.",
  "details": "Detaylar",
  "state": "Durum",
  "load": "Yükü",
  "oftruck": "Aracı İle",
  "start": "Nakliyat Başladı",
  "accepted": "Kabul Edildi",
  "shipment_details": "Nakliyat Detayları",
  "active_shipments": "Aktif Nakliyatlar",
  "success_creating_shipment": "Nakliyat başarıyla oluşturuldu.",
  "error_creating_shipment": "Nakliyat onaylanırken bir hata oluştu!",
  "you_have_accepted_this_offer": "Bu teklifi kabul ettiniz!",
  "you_have_rejected_this_offer": "Bu teklifi red ettiniz!",
  "sent": "Teklif gönderildi",
  "offers": "Teklifler",
  "show_offers": "Teklifleri Görüntüle",
  "now": "Şimdi",
  "chat": "Mesaj",
  "no_offer_found": "Herhangi bir teklif bulunamadı",
  "no_shipment_found": "Nakliyat görüntülenemiyor.",
  "who_sent": "Teklifi Gönderen",
  "reject": "Reddet",
  "success_accept_offer": "Teklif kabul edildi.",
  "error_accept_offer": "Teklif kabul edilemedi. Bilinmeyen bir hata oluştu.",
  "success_reject_offer": "Teklif reddedildi.",
  "error_reject_offer": "Teklif reddedilemedi. Bilinmeyen bir hata oluştu.",
  "no_places_found": "Herhangi bir mekan bulunamadı.",
  "loading": "Yükleniyor...",
  "send_a_message": "Mesaj Gönder",
  "no_chats_found": "Herhangi bir mesaj bulunmadı.",
  "error_creating_chat": "Mesajlarda bir sorun oluştu!",
  "error_creating_offer": "Teklif gönderirken bir sorun oluştu!",
  "success_creating_offer": "Teklif başarıyla gönderildi.",
  "offer_details": "Teklif Detayları",
  "chats": "Mesajlar",
  "show_results": "Sonuçları Göster",
  "hide_results": "Sonuçları Gizle",
  "pick_truck": "Araç seç",
  "user_name": "İletişim Adı",
  "user_details": "İletişim Detayları",
  "upload": "Yükle",
  "view": "Görüntüle",
  "email": "Email",
  "phone": "Telefon",
  "password": "Şifre",
  "password_again": "Şifre Tekrar",
  "forgot_password": "Şifremi Unuttum",
  "login": "Giriş Yap",
  "or": "ya da",
  "user_agreement": " Kullanıcı Sözleşmesi",
  "by_continuing": "Devam ederek",
  "accepted_user_agreement": "'ni kabul etmiş olacaksınız.",
  "sign_up": "Kayıt Ol",
  "already_have_account": "Zaten hesabım var",
  "no_account": "Hesabım yok",
  "add_photo": "Fotoğraf ekle",
  "name": "İsim",
  "surname": "Soyisim",
  "continue": "Devam Et",
  "pick_role": "Bir Rol Seçiniz",
  "carrier": "Taşıyıcı",
  "shipper": "Yük Sahibi",
  "license_front": "Ehliyet Ön Yüz",
  "license_back": "Ehliyet Arka Yüz",
  "id_front": "Kimlik Ön Yüz",
  "id_back": "Kimlik Arka Yüz",
  "src": "SRC belgenizi yükleyiniz",
  "psiko": "Psikoteknik belgenizi yükleyiniz",
  "confirm": "Onayla",
  "input_email": "Email adresinizi giriniz.",
  "input_password": "Şifrenizi giriniz.",
  "input_password_again": "Şifrenizi tekrar giriniz.",
  "input_phone": "Telefon numaranızı giriniz.",
  "input_name": "İsminizi giriniz.",
  "input_surname": "Soyisminizi giriniz.",
  "upload_necessary_files": "Gerekli Dosyaları Yükleyiniz",
  "fill_out": "Bilgilerinizi Giriniz",
  "search": "Arama Yap",
  "discover": "Keşfet",
  "find_load": "Yük Bul",
  "find_loads": "Yükleri Bul",
  "rest": "Dinlen",
  "fuel": "Yakıt Bul",
  "my_vehicles": "Araçlarım",
  "new_vehicle": "Yeni Araç Ekle",
  "new_post_with_vehicle": "Araç için yeni ilan ekle",
  "add_new_truck": "Yeni Araç Ekle",
  "save": "Kaydet",
  "length": "Uzunluk",
  "weight": "Ağırlık",
  "price": "Fiyat",
  "equipment_limits": "Yük Sınırı",
  "full": "Tam",
  "partial": "Kısmi",
  "truck_name": "Araç İsmi",
  "enter_truck_name": "Araç ismi giriniz.",
  "enter_trailer_name": "Dorse ismi giriniz.",
  "enter_description": "Bir açıklama yazınız",
  "enter_load": "Yükünüzü ekleyin.",
  "enter_truck_post": "Aracınızı ilana verin.",
  "description": "Açıklama",
  "enter_truck_description": "Araç için bir açıklama yazınız.",
  "truck_details": "Araç Detayları",
  "origin": "Başlangıç",
  "target": "Hedef",
  "vehicle_type": "Araç Türü",
  "start_date": "Başlangıç Tarihi",
  "end_date": "Bitiş Tarihi",
  "pick_a_date": "Bir tarih seçiniz",
  "max_age": "Max. Yayın Tarihi",
  "published_date": "Yayın Tarihi",
  "pick_a_type": "Araç Türü Seçiniz",
  "pick_an_age": "Maksimum bir yayın tarihi seçiniz",
  "cancel": "İptal",
  "result": "Sonuç",
  "edit_search": "Aramayı Düzenle",
  "request_sent": "İstek Gönderildi",
  "est": "Ort.",
  "load_details": "Yük Detayları",
  "take_the_job": "İşi Al",
  "call": "Ara",
  "total": "Toplam",
  "distance": "Mesafe",
  "vehicle_details": "Araç Detayları",
  "shipping_details": "Nakliye Detayları",
  "rate_details": "Fiyatlandırma Detayları",
  "company_details": "Şirket Detayları",
  "full_partial": "Tam/Kısmi",
  "shipping_type": "Yük Türü",
  "pick_up_date": "Teslim Alma",
  "dock_date": "Teslim Etme",
  "reference": "Referans Kodu",
  "per_km": "KM Başına",
  "company_name": "Şirket İsmi",
  "location": "Konum",
  "rating": "Değerlendirme",
  "registration": "Ruhsat belgenizi yükleyiniz",
  "i_am_a_broker": "Nakliye komisyoncusuyum.\nYük sahibi değilim.",
  "i_am_a_carrier": "Yük taşıyıcısıyım.\nYük sahibi değilim.",
  "i_am_a_shipper": "Yük sahibiyim.",
  "my_loads": "Yüklerim",
  "new_post": "Yeni Yük Oluştur",
  "start_time": "Alma Saati",
  "end_time": "Teslim Saati",
  "pick_a_time": "Bir saat seçiniz",
  "contact_phone": "İletişim Numarası",
  "enter_contact_phone": "Bir iletişim numarası giriniz",
  "enter_price": "Bir fiyat giriniz",
  "post_your_car": "Aracı Yayınla",
  "registered_city": "Kayıtlı Olduğu Şehir",
  "enter_registered_city": "Aracıın kayıtlı olduğu şehri seçiniz",
  "bulk_or_palletized": "Yük Dökmeli mi Paletli mi?",
  "bulk": "Dökmeli",
  "palletized": "Paletli",
  "load_type": "Yük Tipi",
  "post_new_load": "Yeni Yük Oluştur",
  "load_volume": "Yük Hacmi",
  "problem_signing_up": "Kayıt sırasında bir hata oluştu!",
  "problem_creating_new_load": "Yeni yük eklenirken bir hata oluştu!",
  "new_load_created": "Yeni yük başarıyla listelendi.",
  "problem_creating_new_truck_post":
      "Yeni araç ilanı eklenirken bir hata oluştu!",
  "new_truck_post_created": "Yeni araç ilanı başarıyla listelendi.",
  "success_creating_truck": "Yeni araç başarıyla eklendi.",
  "success_editing_truck": "Araç başarıyla güncellendi.",
  "error_editing_truck": "Araç güncellenirken sorun oluştu!",
  "error_creating_truck": "Yeni araç eklenirken bir hata oluştu!.",
  "enter_weight": "Ağırlık giriniz.",
  "enter_length": "Uzunluk giriniz.",
  "enter_volume": "Hacim giriniz.",
  "volume": "Hacim",
  "end_date_must_be_after_than_first_date":
      "Bitiş tarihi başlangıç tarihi ile aynı gün veya sonrasında olmalıdır.",
  "bus": "Otobüs",
  "truck": "Kamyon",
  "car": "Araba",
  "pick_a_phone_number": "Bir iletişim numarası seçiniz",
  "add_new_phone_number": "Yeni numara ekle",
  "available": "Aktif",
  "no_loads_found":
      "Henüz bir yük eklemediniz. Yeni bir yük oluşturabilirsiniz.",
  "my_truck_has_trailer": "Aracımda dorse bulunuyor.",
  "trailer_details": "Dorse Detayları",
  "trailer_name": "Dorse İsmi",
  "trailer_tooltip": "Dorse bilgilerini araç toplamını dahil etmeden giriniz.",
  "pick_existing_trailers": "Mevcut Dorse Seç",
  "search_places": "Arama yap",
  "delete_load_content":
      "Seçilen yükü silmeniz durumunda bütün bilgileriyle kaldırılır.",
  "delete_offer_content":
      "Seçilen teklifi silmeniz durumunda bütün bilgileriyle kaldırılır.",
  "delete_truck_content":
      "Seçilen aracı silmeniz durumunda bütün bilgileriyle kaldırılır.",
  "delete_truck_post_content":
      "Seçilen araç ilanını silmeniz durumunda bütün bilgileriyle kaldırılır.",
  "delete_load_title": "Seçilen yükü silmek istediğinize emin misiniz?",
  "delete_offer_title": "Seçilen teklifi silmek istediğinize emin misiniz?",
  "delete_truck_title": "Seçilen aracı silmek istediğinize emin misiniz?",
  "delete_truck_post_title":
      "Seçilen araç ilanını silmek istediğinize emin misiniz?",
  "offer_deleted_succesfully": "Teklif başarıyla kaldırıldı.",
  "truck_deleted_succesfully": "Araç başarıyla kaldırıldı.",
  "truck_post_deleted_succesfully": "Araç ilanı başarıyla kaldırıldı.",
  "edit_truck": "Aracı Düzenle",
  "my_truck_posts": "Araç İlanlarım",
  "my_profile": "Profilim",
  "broker": "Nakliye Komisyoncusu",
  "contacts": "İletişim Hatları",
  "languages": "Diller",
  "theme": "Tema",
  "files": "Kayıtlı Belgeler",
  "delete_your_account": "Hesabını sil",
  "logout": "Çıkış yap",
  "edit_profile": "Profili Düzenle",
  "error_editing_user": "Profil düzenlenirken bir hata oluştu!.",
  "success_editing_user": "Profil başarıyla güncellendi!.",
  "camera": "Kamera",
  "gallery": "Galeri",
  "may_delete_after_login":
      "Yeniden giriş yaptıktan sonra hesabınızı silebilirsiniz.",
  "switch_language": "Dili Değiştir",
  "error_complete_shipment": "Nakliyat tamamlanırken bir hata oluştu!",
  "success_complete_shipment": "Nakliyat başarıyla tamamlandı.",
  "completed": "Tamamlandı",
  "canceled": "İptal Edildi",
  "you_need_a_profile": "Herhangi bir işlem için kayıt olmalısınız.",
  "gas_station": "Petrol İstasyonu",
  "car_repair": "Oto-Elektrikçi",
  "cafe": "Kafe",
  "restaurant": "Restaurant",
  "hotel": "Otel",
  "park": "Park ve Dinlenme",
  "show_on_map": "Google'da Göster",
  "missing_values" : "Eksik bilgileri doldurunuz!",

};
const Map<String, String> en = {
  "success_adding_in_basket" : "Product added",

  "success_creating_order" : "Order created",
  "error_creating_order" : "Error creating order!",

  "no_product_found" : "No product found",

  "saved_cards" : "Saved Cards",
  "switch_theme" : "Switch Theme",

  "basket" : "Basket",

  "order" : "Order Now",
  "latte_description" : "A latte is a coffee beverage made with espresso and steamed milk. It is often topped with a small amount of foam.",
  "americano_description" : "An americano is a coffee beverage made by diluting espresso with hot water, giving it a similar strength to drip coffee but with a different flavor profile.",
  "mocha_description" : "A mocha is a chocolate-flavored latte. It is typically made with espresso, steamed milk, chocolate syrup, and whipped cream.",
  "espresso_description" : "Espresso is a concentrated form of coffee that is brewed by forcing hot water under high pressure through finely-ground coffee.",

  "welcome" : "Welcome",
  "most_popular" : "Most Popular",
  "all_products" : "All Products",

  "latte" : "Latte" ,
  "americano" : "Americano" ,
  "mocha" : "Mocha",
  "espresso" : "Espresso",
  "the_best_int_town" : "The best in town",
  "coffee" : "Coffee",
  "tea" : "Tea",
  "food" : "Food",
  "profile_view" : "Profile",
  "shop_view" : "Shop",
  "card_view" : "Card",
  "missing_values" : "There are missing values!",
  "show" : "View",
  "new_offer_load_body": "A new offer has been received for your load",
  "new_offer_truck_body": "A new offer has been received for your vehicle",
  "new_offer_load_title": "New offer for your load:",
  "new_offer_truck_title": "New offer for your vehicle:",
  "offer_accepted_load_title": "Offer accepted for your load:",
  "offer_accepted_truck_title": "Offer accepted for your vehicle:",
  "offer_accepted_body": "Your offer has been accepted.",
  "shipment_canceled_body": "Shipment has been canceled",
  "shipment_completed_body": "Shipment has been completed!",
  "new_message_title": "You have a message from",
  "show_on_map": "Show on Google",
  "gas_station": "Gas Station",
  "car_repair": "Auto Electrician",
  "cafe": "Cafe",
  "restaurant": "Restaurant",
  "hotel": "Hotel",
  "park": "Park & Rest Area",
  "anonymous_login": "Continue as Guest",
  "you_need_a_profile": "You must register to proceed.",
  "pick_load": "Select Load",
  "truck_post_details": "Vehicle Listing Details",
  "propose": "Offer",
  "update_shipment_state": "Update Shipment Status",
  "load_received": "Load Received",
  "target_reached": "Target Reached",
  "load_delivered": "Load Delivered",
  "load_owner": "Load Owner",
  "completed": "Completed",
  "canceled": "Canceled",
  "complete": "Finish",
  "this_shipment_is_canceled": "This shipment has been canceled!",
  "this_shipment_is_completed": "This shipment is completed.",
  "error_cancel_shipment": "An error occurred while canceling the shipment!",
  "success_cancel_shipment": "Shipment successfully canceled.",
  "error_complete_shipment": "An error occurred while completing the shipment!",
  "success_complete_shipment": "Shipment successfully completed.",
  "state": "State",
  "details": "Details",
  "start": "Shipment Started",
  "load": "Load",
  "oftruck": "With Vehicle",
  "shipment_details": "Shipment Details",
  "accepted": "Accepted",
  "active_shipments": "Active Shipments",
  "no_shipment_found": "No shipment found.",
  "success_creating_shipment": "Shipment successfully created.",
  "error_creating_shipment": "An error occurred while confirming the shipment!",
  "now": "Now",
  "offers": "Offers",
  "you_have_accepted_this_offer": "You have accepted this offer!",
  "you_have_rejected_this_offer": "You have rejected this offer!",
  "no_offer_found": "No offers found.",
  "chat": "Chat",
  "show_offers": "View Offers",
  "who_sent": "Offer Sender",
  "reject": "Reject",
  "success_accept_offer": "Offer accepted.",
  "error_accept_offer": "Offer could not be accepted. An unknown error occurred.",
  "success_reject_offer": "Offer rejected.",
  "error_reject_offer": "Offer could not be rejected. An unknown error occurred.",
  "delete_offer_content": "Deleting the selected offer will remove all its information.",
  "delete_offer_title": "Are you sure you want to delete the selected offer?",
  "offer_deleted_succesfully": "Offer successfully removed.",
  "error_creating_offer": "An error occurred while sending an offer!",
  "success_creating_offer": "Offer sent successfully",
  "offer_details": "Offer Details",
  "send_a_message": "Send a Message",
  "no_places_found": "No places found.",
  "loading": "Loading...",
  "chats": "Chats",
  "no_chats_found": "No chats found",
  "show_results": "Show Results",
  "hide_results": "Hide Results",
  "email": "Email",
  "phone": "Phone",
  "password": "Password",
  "password_again": "Repeat Password",
  "forgot_password": "Forgot Password",
  "login": "Login",
  "or": "or",
  "user_agreement": " User Agreement",
  "by_continuing": "By continuing",
  "accepted_user_agreement": "you accept the terms.",
  "sign_up": "Sign Up",
  "already_have_account": "Already have an account",
  "no_account": "Don't have an account",
  "add_photo": "Add Photo",
  "name": "Name",
  "surname": "Surname",
  "continue": "Continue",
  "pick_role": "Select a Role",
  "carrier": "Carrier",
  "shipper": "Shipper",
  "license_front": "Driver's License Front",
  "license_back": "Driver's License Back",
  "id_front": "ID Front",
  "id_back": "ID Back",
  "src": "Upload your SRC document",
  "psiko": "Upload your psychotechnic document",
  "confirm": "Confirm",
  "input_email": "Enter your email address.",
  "input_password": "Enter your password.",
  "input_password_again": "Re-enter your password.",
  "input_phone": "Enter your phone number.",
  "input_name": "Enter your name.",
  "input_surname": "Enter your surname.",
  "upload_necessary_files": "Upload Required Files",
  "fill_out": "Enter Your Information",
  "search": "Search",
  "discover": "Discover",
  "find_load": "Find Load",
  "find_loads": "Find Loads",
  "rest": "Rest",
  "fuel": "Find Fuel",
  "my_vehicles": "My Vehicles",
  "new_vehicle": "Add New Vehicle",
  "new_post_with_vehicle": "Add a new listing for a vehicle",
  "add_new_truck": "Add New Vehicle",
  "save": "Save",
  "length": "Length",
  "weight": "Weight",
  "price": "Price",
  "equipment_limits": "Load Limit",
  "full": "Full",
  "partial": "Partial",
  "truck_name": "Vehicle Name",
  "enter_truck_name": "Enter vehicle name.",
  "enter_trailer_name": "Enter trailer name.",
  "enter_description": "Enter a description",
  "description": "Description",
  "enter_truck_description": "Enter a description for the vehicle.",
  "truck_details": "Vehicle Details",
  "origin": "Origin",
  "target": "Target",
  "vehicle_type": "Vehicle Type",
  "start_date": "Start Date",
  "end_date": "End Date",
  "pick_a_date": "Select a date",
  "max_age": "Max. Publish Date",
  "published_date": "Publish Date",
  "pick_a_type": "Select Vehicle Type",
  "pick_an_age": "Select a maximum publish date",
  "cancel": "Cancel",
  "result": "Result",
  "edit_search": "Edit Search",
  "request_sent": "Request Sent",
  "est": "Est.",
  "load_details": "Load Details",
  "take_the_job": "Take the Job",
  "call": "Call",
  "total": "Total",
  "distance": "Distance",
  "vehicle_details": "Vehicle Details",
  "shipping_details": "Shipping Details",
  "rate_details": "Pricing Details",
  "company_details": "Company Details",
  "full_partial": "Full/Partial",
  "shipping_type": "Load Type",
  "pick_up_date": "Pickup Date",
  "dock_date": "Delivery Date",
  "reference": "Reference Code",
  "per_km": "Per KM",
  "company_name": "Company Name",
  "location": "Location",
  "rating": "Rating",
  "registration": "Upload your registration document",
  "i_am_a_broker": "I am a freight broker.\nI am not a load owner.",
  "i_am_a_carrier": "I am a freight carrier.\nI am not a load owner.",
  "i_am_a_shipper": "I am a load owner.",
  "my_loads": "My Loads",
  "new_post": "Create New Load",
  "start_time": "Pickup Time",
  "end_time": "Delivery Time",
  "pick_a_time": "Select a time",
  "contact_phone": "Contact Number",
  "enter_contact_phone": "Enter a contact number",
  "enter_price": "Enter a price",
  "post_your_car": "List Vehicle",
  "registered_city": "Registered City",
  "enter_registered_city": "Select the registered city of the vehicle",
  "bulk_or_palletized": "Is the load bulk or palletized?",
  "bulk": "Bulk",
  "palletized": "Palletized",
  "load_type": "Load Type",
  "post_new_load": "Create New Load",
  "load_volume": "Load Volume",
  "problem_signing_up": "An error occurred during registration!",
  "problem_creating_new_load": "An error occurred while adding a new load!",
  "new_load_created": "New load successfully listed.",
  "problem_creating_new_truck_post": "An error occurred while adding a new vehicle listing!",
  "new_truck_post_created": "New vehicle listing successfully created.",
  "success_creating_truck": "New vehicle successfully added.",
  "success_editing_truck": "Vehicle successfully updated.",
  "error_editing_truck": "An issue occurred while updating the vehicle!",
  "error_creating_truck": "An error occurred while adding a new vehicle!",
  "enter_weight": "Enter weight.",
  "enter_length": "Enter length.",
  "enter_volume": "Enter volume.",
  "volume": "Volume",
  "end_date_must_be_after_than_first_date": "End date must be the same or after the start date.",
  "bus": "Bus",
  "truck": "Truck",
  "car": "Car",
  "pick_a_phone_number": "Select a contact number",
  "add_new_phone_number": "Add new number",
  "available": "Active",
  "no_loads_found": "You have not added any load yet. You can create a new load.",
  "my_truck_has_trailer": "My vehicle has a trailer.",
  "trailer_details": "Trailer Details",
  "trailer_name": "Trailer Name",
  "trailer_tooltip": "Enter trailer information without including the vehicle total.",
  "pick_existing_trailers": "Select Existing Trailer",
  "search_places": "Search places",
  "delete_load_content": "Deleting the selected load will remove all its information.",
  "delete_truck_content": "Deleting the selected vehicle will remove all its information.",
  "delete_truck_post_content": "Deleting the selected vehicle listing will remove all its information.",
  "delete_load_title": "Are you sure you want to delete the selected load?",
  "delete_truck_title": "Are you sure you want to delete the selected vehicle?",
  "delete_truck_post_title": "Are you sure you want to delete the selected vehicle listing?",
  "load_deleted_succesfully": "Load successfully removed.",
  "truck_deleted_succesfully": "Vehicle successfully removed.",
  "truck_post_deleted_succesfully": "Vehicle listing successfully removed.",
  "edit_truck": "Edit Vehicle",
  "my_truck_posts": "My Vehicle Listings",
  "my_profile": "My Profile",
  "broker": "Freight Broker",
  "contacts": "Contact Lines",
  "languages": "Languages",
  "theme": "Theme",
  "files": "Saved Documents",
  "delete_your_account": "Delete Your Account",
  "logout": "Log Out",
  "edit_profile": "Edit Profile",
  "error_editing_user": "An error occurred while editing the profile!",
  "success_editing_user": "Profile successfully updated!",
  "camera": "Camera",
  "gallery": "Gallery",
  "may_delete_after_login": "You can delete your account after logging in again.",
  "switch_language": "Change Language",
  "go_home" : "Go Home",
};
const Map<String, String> ar = {
  "go_home" : "Go Home",
  "success_adding_in_basket" : "Product added",
  "no_product_found" : "No product found",
  "success_creating_order" : "Order created",
  "error_creating_order" : "Error creating order!",

  "saved_cards": "البطاقات المحفوظة",
"switch_theme": "تغيير السمة",

"basket": "السلة",

"order": "اطلب الآن",
"latte_description": "اللاتيه هو مشروب قهوة مصنوع من الإسبريسو والحليب المبخر، وغالبًا ما يُضاف إليه القليل من الرغوة.",
"americano_description": "الأمريكانو هو مشروب قهوة يُحضّر بتخفيف الإسبريسو بالماء الساخن، مما يمنحه قوة مشابهة للقهوة المقطرة ولكن بنكهة مختلفة.",
"mocha_description": "الموكا هو لاتيه بنكهة الشوكولاتة، يُصنع عادةً من الإسبريسو والحليب المبخر وشراب الشوكولاتة والكريمة المخفوقة.",
"espresso_description": "الإسبريسو هو قهوة مركزة يتم تحضيرها بتمرير الماء الساخن تحت ضغط عالٍ عبر البن المطحون ناعماً.",

"welcome": "مرحبًا",
"most_popular": "الأكثر شهرة",
"all_products": "جميع المنتجات",

"latte": "لاتيه",
"americano": "أمريكانو",
"mocha": "موكا",
"espresso": "إسبريسو",
"the_best_int_town": "الأفضل في المدينة",
"coffee": "قهوة",
"tea": "شاي",
"food": "طعام",
"profile_view": "الملف الشخصي",
"shop_view": "المتجر",
"card_view": "البطاقة",
"missing_values": "هناك قيم مفقودة!",
"show": "عرض",
"new_offer_load_body": "تم استلام عرض جديد لشحنتك",
"new_offer_truck_body": "تم استلام عرض جديد لمركبتك",
"new_offer_load_title": "عرض جديد لشحنتك:",
"new_offer_truck_title": "عرض جديد لمركبتك:",
"offer_accepted_load_title": "تم قبول العرض لشحنتك:",
"offer_accepted_truck_title": "تم قبول العرض لمركبتك:",
"offer_accepted_body": "تم قبول عرضك.",
"shipment_canceled_body": "تم إلغاء الشحنة",
"shipment_completed_body": "تم اكتمال الشحنة!",
"new_message_title": "لديك رسالة من",
"show_on_map": "عرض على خرائط جوجل",
"gas_station": "محطة وقود",
"car_repair": "كهربائي سيارات",
"cafe": "مقهى",
"restaurant": "مطعم",
"hotel": "فندق",
"park": "منتزه ومنطقة راحة",
"anonymous_login": "المتابعة كضيف",
"you_need_a_profile": "يجب عليك التسجيل للمتابعة.",
"pick_load": "اختر الشحنة",
"truck_post_details": "تفاصيل قائمة المركبة",
"propose": "عرض",
"update_shipment_state": "تحديث حالة الشحنة",
"load_received": "تم استلام الشحنة",
"target_reached": "تم الوصول إلى الوجهة",
"load_delivered": "تم تسليم الشحنة",
"load_owner": "مالك الشحنة",
"completed": "مكتمل",
"canceled": "ملغي",
"complete": "إنهاء",
"this_shipment_is_canceled": "تم إلغاء هذه الشحنة!",
"this_shipment_is_completed": "تم اكتمال هذه الشحنة.",
"error_cancel_shipment": "حدث خطأ أثناء إلغاء الشحنة!",
"success_cancel_shipment": "تم إلغاء الشحنة بنجاح.",
"error_complete_shipment": "حدث خطأ أثناء إكمال الشحنة!",
"success_complete_shipment": "تم إكمال الشحنة بنجاح.",
"state": "الحالة",
"details": "التفاصيل",
"start": "تم بدء الشحنة",
"load": "الشحنة",
"oftruck": "بالمركبة",
"shipment_details": "تفاصيل الشحنة",
"accepted": "مقبول",
"active_shipments": "الشحنات النشطة",
"no_shipment_found": "لم يتم العثور على شحنة.",
"success_creating_shipment": "تم إنشاء الشحنة بنجاح.",
"error_creating_shipment": "حدث خطأ أثناء تأكيد الشحنة!",
"now": "الآن",
"offers": "العروض",
"you_have_accepted_this_offer": "لقد قبلت هذا العرض!",
"you_have_rejected_this_offer": "لقد رفضت هذا العرض!",
"no_offer_found": "لم يتم العثور على عروض.",
"chat": "الدردشة",
"show_offers": "عرض العروض",
"who_sent": "مرسل العرض",
"reject": "رفض",
"success_accept_offer": "تم قبول العرض.",
"error_accept_offer": "تعذر قبول العرض. حدث خطأ غير معروف.",
"success_reject_offer": "تم رفض العرض.",
"error_reject_offer": "تعذر رفض العرض. حدث خطأ غير معروف.",
"delete_offer_content": "سيؤدي حذف العرض المحدد إلى إزالة جميع معلوماته.",
"delete_offer_title": "هل أنت متأكد من رغبتك في حذف العرض المحدد؟",
"offer_deleted_succesfully": "تم حذف العرض بنجاح.",
"error_creating_offer": "حدث خطأ أثناء إرسال العرض!",
"success_creating_offer": "تم إرسال العرض بنجاح",
"offer_details": "تفاصيل العرض",
"send_a_message": "إرسال رسالة",
"no_places_found": "لم يتم العثور على أماكن.",
"loading": "جاري التحميل...",
"chats": "الدردشات",
"no_chats_found": "لم يتم العثور على محادثات",
"show_results": "عرض النتائج",
"hide_results": "إخفاء النتائج",
"email": "البريد الإلكتروني",
"phone": "الهاتف",
"password": "كلمة المرور",
"password_again": "أعد إدخال كلمة المرور",
"forgot_password": "نسيت كلمة المرور",
"login": "تسجيل الدخول",
"or": "أو",
"user_agreement": "اتفاقية المستخدم",
"by_continuing": "بالمتابعة",
"accepted_user_agreement": "أنت توافق على الشروط.",
"sign_up": "إنشاء حساب",
"already_have_account": "هل لديك حساب بالفعل؟",
"no_account": "ليس لديك حساب؟",
"add_photo": "إضافة صورة",
"name": "الاسم",
"surname": "اللقب",
"continue": "متابعة",
"pick_role": "اختر دورًا",
"carrier": "الناقل",
"shipper": "المرسل",
"license_front": "الوجه الأمامي لرخصة القيادة",
"license_back": "الوجه الخلفي لرخصة القيادة",
"id_front": "الوجه الأمامي للهوية",
"id_back": "الوجه الخلفي للهوية",
"src": "تحميل مستند SRC الخاص بك",
"psiko": "تحميل مستند الفحص النفسي التقني",
"confirm": "تأكيد",
"input_email": "أدخل عنوان بريدك الإلكتروني.",
"input_password": "أدخل كلمة المرور.",
"input_password_again": "أعد إدخال كلمة المرور.",
"input_phone": "أدخل رقم هاتفك.",
"input_name": "أدخل اسمك.",
"input_surname": "أدخل لقبك.",
"upload_necessary_files": "تحميل الملفات المطلوبة",
"fill_out": "أدخل معلوماتك",
"search": "بحث",
"discover": "اكتشف",
"find_load": "ابحث عن شحنة",
"find_loads": "البحث عن الشحنات",
"rest": "استراحة",
"fuel": "ابحث عن وقود",
"my_vehicles": "مركباتي",
"new_vehicle": "إضافة مركبة جديدة",
"new_post_with_vehicle": "إضافة إعلان جديد لمركبة",
"add_new_truck": "إضافة مركبة جديدة",
"save": "حفظ",
"length": "الطول",
"weight": "الوزن",
"price": "السعر",
"equipment_limits": "حد الحمولة",
"full": "كامل",
"partial": "جزئي",
"truck_name": "اسم المركبة",
"enter_truck_name": "أدخل اسم المركبة.",
"enter_trailer_name": "أدخل اسم المقطورة.",
"enter_description": "أدخل وصفًا",
"description": "الوصف",
"enter_truck_description": "أدخل وصفًا للمركبة.",
"truck_details": "تفاصيل المركبة",
"origin": "نقطة الانطلاق",
"target": "الوجهة",
"vehicle_type": "نوع المركبة",
"start_date": "تاريخ البدء",
"end_date": "تاريخ الانتهاء",
"pick_a_date": "اختر تاريخًا",
"max_age": "تاريخ النشر الأقصى",
"published_date": "تاريخ النشر",
"pick_a_type": "اختر نوع المركبة",
"pick_an_age": "اختر تاريخ نشر أقصى",
"cancel": "إلغاء",
"result": "النتيجة",
"edit_search": "تعديل البحث",
"request_sent": "تم إرسال الطلب",
"est": "تقديري",
"load_details": "تفاصيل الشحنة",
"take_the_job": "قبول المهمة",
"call": "اتصال",
"total": "الإجمالي",
"distance": "المسافة",
"vehicle_details": "تفاصيل المركبة",
"shipping_details": "تفاصيل الشحن",
"rate_details": "تفاصيل التسعير",
"company_details": "تفاصيل الشركة",
"full_partial": "كامل/جزئي",
"shipping_type": "نوع الحمولة",
"pick_up_date": "تاريخ الاستلام",
"dock_date": "تاريخ التسليم",
"reference": "رمز المرجع",
"per_km": "لكل كيلومتر",
"company_name": "اسم الشركة",
"location": "الموقع",
"rating": "التقييم",
"registration": "تحميل مستند التسجيل",
"i_am_a_broker": "أنا وسيط شحن.\nلست مالك الشحنة.",
"i_am_a_carrier": "أنا ناقل بضائع.\nلست مالك الشحنة.",
"i_am_a_shipper": "أنا مالك الشحنة.",
"my_loads": "شحناتي",
"new_post": "إنشاء شحنة جديدة",
"start_time": "وقت الاستلام",
"end_time": "وقت التسليم",
"pick_a_time": "اختر وقتًا",
  "contact_phone": "رقم الاتصال",
  "enter_contact_phone": "أدخل رقم الاتصال",
  "enter_price": "أدخل السعر",
  "post_your_car": "إدراج مركبة",
  "registered_city": "المدينة المسجلة",
  "enter_registered_city": "اختر المدينة المسجلة للمركبة",
  "bulk_or_palletized": "هل الحمولة سائبة أم على منصات نقالة؟",
  "bulk": "سائب",
  "palletized": "على منصات نقالة",
  "load_type": "نوع الحمولة",
  "post_new_load": "إنشاء شحنة جديدة",
  "load_volume": "حجم الحمولة",
  "problem_signing_up": "حدث خطأ أثناء التسجيل!",
  "problem_creating_new_load": "حدث خطأ أثناء إضافة شحنة جديدة!",
  "new_load_created": "تم إدراج الشحنة الجديدة بنجاح.",
  "problem_creating_new_truck_post": "حدث خطأ أثناء إضافة إعلان مركبة جديدة!",
  "new_truck_post_created": "تم إنشاء إعلان المركبة الجديد بنجاح.",
  "success_creating_truck": "تمت إضافة المركبة الجديدة بنجاح.",
  "success_editing_truck": "تم تحديث المركبة بنجاح.",
  "error_editing_truck": "حدث خطأ أثناء تحديث المركبة!",
  "error_creating_truck": "حدث خطأ أثناء إضافة مركبة جديدة!",
  "enter_weight": "أدخل الوزن.",
  "enter_length": "أدخل الطول.",
  "enter_volume": "أدخل الحجم.",
  "volume": "الحجم",
  "end_date_must_be_after_than_first_date": "يجب أن يكون تاريخ الانتهاء في نفس اليوم أو بعد تاريخ البدء.",
  "bus": "حافلة",
  "truck": "شاحنة",
  "car": "سيارة",
  "pick_a_phone_number": "اختر رقم اتصال",
  "add_new_phone_number": "إضافة رقم جديد",
  "available": "نشط",
  "no_loads_found": "لم تقم بإضافة أي شحنة بعد. يمكنك إنشاء شحنة جديدة.",
  "my_truck_has_trailer": "مركبتي تحتوي على مقطورة.",
  "trailer_details": "تفاصيل المقطورة",
  "trailer_name": "اسم المقطورة",
  "trailer_tooltip": "أدخل معلومات المقطورة دون تضمين إجمالي المركبة.",
  "pick_existing_trailers": "اختر مقطورة موجودة",
  "search_places": "البحث عن أماكن",
  "delete_load_content": "سيؤدي حذف الشحنة المحددة إلى إزالة جميع معلوماتها.",
  "delete_truck_content": "سيؤدي حذف المركبة المحددة إلى إزالة جميع معلوماتها.",
  "delete_truck_post_content": "سيؤدي حذف إعلان المركبة المحدد إلى إزالة جميع معلوماته.",
  "delete_load_title": "هل أنت متأكد أنك تريد حذف الشحنة المحددة؟",
  "delete_truck_title": "هل أنت متأكد أنك تريد حذف المركبة المحددة؟",
  "delete_truck_post_title": "هل أنت متأكد أنك تريد حذف إعلان المركبة المحدد؟",
  "load_deleted_succesfully": "تمت إزالة الشحنة بنجاح.",
  "truck_deleted_succesfully": "تمت إزالة المركبة بنجاح.",
  "truck_post_deleted_succesfully": "تمت إزالة إعلان المركبة بنجاح.",
  "edit_truck": "تعديل المركبة",
  "my_truck_posts": "إعلانات مركباتي",
  "my_profile": "ملفي الشخصي",
  "broker": "وسيط شحن",
  "contacts": "خطوط الاتصال",
  "languages": "اللغات",
  "theme": "السمة",
  "files": "المستندات المحفوظة",
  "delete_your_account": "حذف حسابك",
  "logout": "تسجيل الخروج",
  "edit_profile": "تعديل الملف الشخصي",
  "error_editing_user": "حدث خطأ أثناء تعديل الملف الشخصي!",
  "success_editing_user": "تم تحديث الملف الشخصي بنجاح!",
  "camera": "الكاميرا",
  "gallery": "المعرض",
  "may_delete_after_login": "يمكنك حذف حسابك بعد تسجيل الدخول مرة أخرى.",
  "switch_language": "تغيير اللغة"
};
