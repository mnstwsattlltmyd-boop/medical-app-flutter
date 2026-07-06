# تطبيق الرعاية الطبية الذكي - Flutter

تطبيق طبي متكامل مبني بـ **Flutter** يوفر واجهة احترافية لمراقبة المؤشرات الحيوية والملفات الطبية.

## المميزات

✅ **شاشة ترحيب** - بتصميم احترافي مع أنيميشن جميل
✅ **تسجيل دخول وإنشاء حساب** - واجهة سهلة وآمنة
✅ **التحقق من OTP** - تأكيد الحساب برمز التحقق
✅ **إعداد الملف الطبي** - إدخال البيانات الصحية والطبية
✅ **ربط الروبوت الطبي** - اتصال سلس مع أجهزة المراقبة
✅ **لوحة مؤشرات حيوية** - عرض فوري للقراءات مع إحصائيات يومية
✅ **تصميم متجاوب** - يعمل بكفاءة على جميع أحجام الشاشات
✅ **ألوان طبية احترافية** - أزرق وأخضر طبي

## المتطلبات

- **Flutter SDK** (إصدار 3.0 أو أحدث)
- **Dart SDK** (مرفق مع Flutter)
- **Android Studio** أو **Xcode** (للتطوير على iOS)

## خطوات التثبيت والتشغيل

### 1. تثبيت Flutter

#### على Windows:
```bash
# حمّل Flutter من الموقع الرسمي
https://flutter.dev/docs/get-started/install/windows

# أضفه إلى متغير البيئة PATH
```

#### على macOS:
```bash
# باستخدام Homebrew
brew install flutter

# أو حمّل يدوياً من الموقع الرسمي
https://flutter.dev/docs/get-started/install/macos
```

#### على Linux:
```bash
# حمّل Flutter
cd ~
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz
tar xf flutter_linux_3.24.3-stable.tar.xz

# أضفه إلى PATH
export PATH="$PATH:$HOME/flutter/bin"

# تحقق من التثبيت
flutter --version
```

### 2. استنساخ أو نسخ المشروع

```bash
# انسخ مجلد المشروع إلى مكان آمن
cd /path/to/flutter_medical_app
```

### 3. تثبيت المكتبات

```bash
# تحديث Flutter
flutter upgrade

# تثبيت المكتبات المطلوبة
flutter pub get
```

### 4. تشغيل التطبيق

#### على محاكي Android:
```bash
# تأكد من تشغيل محاكي Android أولاً
flutter run
```

#### على جهاز iOS:
```bash
# تأكد من تثبيت CocoaPods
cd ios
pod install
cd ..

# شغّل التطبيق
flutter run
```

#### على ويب (للاختبار السريع):
```bash
flutter run -d chrome
```

## هيكل المشروع

```
flutter_medical_app/
├── lib/
│   ├── main.dart                          # نقطة الدخول الرئيسية
│   ├── screens/
│   │   ├── splash_screen.dart            # شاشة الترحيب
│   │   ├── auth_screen.dart              # تسجيل الدخول
│   │   ├── otp_screen.dart               # التحقق من OTP
│   │   ├── medical_profile_screen.dart   # الملف الطبي
│   │   ├── robot_connection_screen.dart  # ربط الروبوت
│   │   └── dashboard_screen.dart         # لوحة المؤشرات
│   └── constants/
│       └── colors.dart                   # الألوان والثوابت
├── pubspec.yaml                          # إدارة المكتبات
└── README.md                             # هذا الملف
```

## المكتبات المستخدمة

- **Flutter Material Design** - واجهة المستخدم
- **Google Fonts** - خطوط احترافية
- **Flutter Animate** - أنيميشنات سلسة
- **Intl** - دعم اللغات والتواريخ

## الميزات المتقدمة

### 1. نظام الألوان الطبي
```dart
// استخدم الألوان من MedicalColors
MedicalColors.medicalBlue      // الأزرق الطبي
MedicalColors.medicalGreen     // الأخضر الطبي
MedicalColors.darkBlue         // الأزرق الداكن
```

### 2. الأنيميشنات
- أنيميشن نبض القلب في شاشة الترحيب
- أنيميشن النبض في شاشة ربط الروبوت
- انتقالات سلسة بين الشاشات

### 3. محاكاة البيانات
التطبيق يحاكي قراءات المؤشرات الحيوية تلقائياً كل 3 ثوانٍ:
- نبض القلب: 60-90 نبضة/دقيقة
- درجة الحرارة: 36.5-37.5 درجة مئوية
- الأكسجين: 95-100%

## الخطوات التالية

### إضافة ميزات جديدة:

1. **قاعدة بيانات محلية** - استخدم SQLite أو Hive
```bash
flutter pub add sqflite
```

2. **اتصال بـ API** - استخدم HTTP أو Dio
```bash
flutter pub add dio
```

3. **إشعارات فورية** - استخدم Firebase
```bash
flutter pub add firebase_messaging
```

4. **رسوم بيانية** - استخدم FL Chart
```bash
flutter pub add fl_chart
```

## حل المشاكل الشائعة

### مشكلة: "Flutter not found"
```bash
# تأكد من إضافة Flutter إلى PATH
export PATH="$PATH:$HOME/flutter/bin"
```

### مشكلة: "Gradle build failed"
```bash
# نظّف المشروع
flutter clean

# أعد التثبيت
flutter pub get
```

### مشكلة: "CocoaPods error" على iOS
```bash
cd ios
rm -rf Pods
rm Podfile.lock
pod install
cd ..
```

## الدعم والمساعدة

للمزيد من المعلومات، زر:
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design](https://material.io/design)

## الترخيص

هذا المشروع مفتوح المصدر ومتاح للاستخدام الحر.

---

**تم إنشاؤه بـ ❤️ لتحسين الرعاية الطبية**
