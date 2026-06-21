# 🌾 Cân Lúa (Rice Weighing)

**English** | [Tiếng Việt](README.vi.md)

A Flutter mobile application designed to digitize agricultural rice weighing sheets, track market prices, view news feeds, and consult with an AI assistant. Optimized offline-first for farmers in the Mekong Delta (ĐBSCL).

---

## 🚀 Key Features

* **Weighing Records & Grid Input:**
  * 5x6 (30 cells) grid layout matching traditional column-major hand-drawn tables.
  * Direct cell tapping to select and edit any entry with real-time live-preview.
  * Collapsible quick configuration panel (tare weight, impurity, moisture) with inline tooltips explaining calculations.
  * Text-To-Speech (TTS) integration reading weights aloud in Vietnamese alongside haptic feedback.
* **Weighing Card & Transaction Management:**
  * Card list featuring search, date/debt filters, and swipe-to-delete with undo.
  * Redesigned card details highlighting key metrics: Net Weight, Total Amount, and Remaining Debt.
  * Financial transaction logs (deposits, payments, refunds).
* **Market Prices & News:**
  * Real-time rice/paddy price lookup synchronized with Firestore (cached in Drift SQLite for offline usage).
  * RSS news feeds with automated categorization.
* **AI Crop Advisor:**
  * Conversational crop helper powered by OpenRouter API (Gemini-Flash-1.5).
  * Automatically injects current market prices and localized agronomy knowledge context into chats.
* **Dashboard Analytics:**
  * Statistical season insights and multi-season comparisons (bar and pie charts via fl_chart).

---

## 🛠️ Tech Stack

* **State Management:** Riverpod (`flutter_riverpod`)
* **Local Database:** Drift (`drift` + `drift_dev`) - Type-safe SQLite.
* **Navigation:** GoRouter (`go_router`)
* **Charts:** fl_chart (`fl_chart`)
* **API Client:** Dio (`dio`)
* **TTS & STT:** `flutter_tts`, `speech_to_text`
* **Markdown:** `flutter_markdown`
* **Theme:** Light & Dark theme support.

---

## 📁 Directory Structure

```text
lib/
├── core/
│   ├── theme/            # Theme, colors (purple banned), typography
│   ├── constants/        # Default rice varieties, general app constants
│   └── utils/            # Calculation engine (RiceCalculator), formatters
├── database/             # AppDatabase Drift SQLite setup
├── features/
│   ├── weighing/         # Weighing cards, details & input grid
│   ├── market/           # Market price board
│   ├── news/             # RSS news reader
│   ├── ai_chat/          # AI Chat bot assistant
│   └── dashboard/        # Season stats & comparisons
└── services/             # TTS, Firestore, AI API, RSS parsing
```

---

## 🏁 Getting Started

### 1. Prerequisites
* Flutter SDK (Latest stable version)
* Android SDK / Xcode (for iOS target)

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Generate drift code
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Run the app
```bash
flutter run
```

### 5. Run tests
```bash
flutter test
```

---

## ⚠️ Core Development Principles

1. **Purple/Violet Ban:** Never use purple or violet color palette anywhere in the application.
2. **Touch Targets:** All interactive widgets (buttons, cells) must have a touch target of at least $48 \times 48\text{dp}$.
3. **Offline-first:** All agricultural computations (net weight, totals, remaining debt) must run locally and instantly via the database, without requiring network latency.
