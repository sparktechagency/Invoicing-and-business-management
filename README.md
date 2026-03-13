<h1 align="center">📊 Invoicing Business Management</h1>

<p align="center">
A modern <b>Flutter-based invoicing and business management application</b> designed to manage invoices, purchases, products, expenses, and reports efficiently.
</p>

<hr>

<h2>✨ Features</h2>

<ul>
<li>📄 Invoice Management</li>
<li>📊 Dashboard & Business Overview</li>
<li>👥 Customer & Supplier Management</li>
<li>📦 Product & Service Management</li>
<li>💰 Expense Tracking</li>
<li>🧾 Estimates & Proforma Invoices</li>
<li>📑 Purchase Orders & Bills</li>
<li>📊 Business Reports</li>
<li>🌙 Dark Mode / ☀️ Light Mode</li>
<li>🌍 Multi Language Support</li>
<li>🔐 Secure Authentication</li>
</ul>

<hr>

<h2>🌙 Theme Support</h2>

<ul>
<li>Light Theme</li>
<li>Dark Theme</li>
<li>Dynamic Theme Switching</li>
</ul>

<hr>

<h2>🌍 Localization</h2>

<p>The application supports multiple languages.</p>

<ul>
<li>English</li>
<li>Bangla</li>
<li>Hindi</li>
</ul>

<hr>

<h2>🛠 Technology Stack</h2>

<ul>
<li><b>Flutter</b> – Cross-platform mobile app development</li>
<li><b>Dart</b> – Programming language</li>
<li><b>REST API</b> – Backend communication</li>
<li><b>MySQL</b> – Database</li>
<li><b>JSON</b> – API Data format</li>
</ul>

<hr>

<h2>📂 Project Architecture</h2>

<p>
The project follows a <b>Clean Architecture + Feature First Structure</b> for better scalability and maintainability.
</p>

<pre>
lib/
├── main.dart
├── app.dart
│
├── core/
│   ├── config/
│   │   ├── env.dart
│   │   ├── flavor.dart
│   │   └── app_config.dart
│   │
│   ├── constants/
│   │   ├── api_endpoints.dart
│   │   ├── app_constants.dart
│   │   └── assets.dart
│   │
│   ├── errors/
│   │   ├── exceptions.dart
│   │   ├── failures.dart
│   │   └── error_mapper.dart
│   │
│   ├── network/
│   │   ├── network_service.dart
│   │   ├── network_service_response.dart
│   │   ├── interceptors.dart
│   │   └── connectivity_service.dart
│   │
│   ├── storage/
│   │   ├── secure_storage_service.dart
│   │   ├── local_storage_service.dart
│   │   └── cache_service.dart
│   │
│   ├── localization/
│   │   ├── l10n.dart
│   │   ├── app_localizations.dart
│   │   └── translations/
│   │       ├── en.json
│   │       ├── bn.json
│   │       └── hi.json
│   │
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── light_theme.dart
│   │   ├── dark_theme.dart
│   │   └── theme_controller.dart
│   │
│   ├── di/
│   │   ├── injection.dart
│   │   └── bindings.dart
│   │
│   └── utils/
│       ├── validators.dart
│       ├── formatters.dart
│       ├── date_time_utils.dart
│       └── debouncer.dart
│
├── routes/
│   ├── app_pages.dart
│   └── app_routes.dart
│
├── shared/
│   ├── widgets/
│   │   ├── app_button.dart
│   │   ├── app_text_field.dart
│   │   ├── app_loader.dart
│   │   ├── app_dialog.dart
│   │   └── app_snackbar.dart
│   │
│   ├── styles/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_spacing.dart
│   │
│   └── helpers/
│       ├── permission_helper.dart
│       └── map_helper.dart
│
└── features/
    ├── auth/
    ├── onboarding/
    ├── map/
    ├── ride/
    ├── payment/
    ├── wallet/
    ├── notifications/
    ├── settings/
    └── profile/
</pre>

<hr>

<h2>🚀 Getting Started</h2>

<h3>1 Clone Repository</h3>

<pre>
git clone https://github.com/yourusername/invoicing_business_management.git
</pre>

<h3>2 Open Project</h3>

<pre>
cd invoicing_business_management
</pre>

<h3>3 Install Dependencies</h3>

<pre>
flutter pub get
</pre>

<h3>4 Run Application</h3>

<pre>
flutter run
</pre>

<hr>

<h2>📦 Build Release</h2>

<h3>Build APK</h3>

<pre>
flutter build apk --release
</pre>

<h3>Build App Bundle</h3>

<pre>
flutter build appbundle
</pre>

<hr>

<h2>👨‍💻 Developer</h2>

<p>
Developed with ❤️ using <b>Flutter</b>
</p>

<hr>

<h2>📄 License</h2>

<p>MIT License</p>
