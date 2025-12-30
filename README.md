# 📡 Flutter Fetch JSON Data

**Flutter Fetch JSON Data** is a simple Flutter application that demonstrates how to **fetch data from a JSON endpoint** and display it in a Flutter UI.  
The app uses the `http` package to make network requests and handles JSON responses to populate widgets dynamically.

This project is great for learning networking in Flutter, handling asynchronous operations, parsing JSON, and updating the UI based on API data.

---

## 🌟 Features

- 🌐 Fetch JSON data from a remote API
- 📊 Display data in a ListView
- 🔄 Loading & error state handling
- 📱 Clean and responsive UI
- 🧠 Built with Flutter and best practices

---

## 🛠 Tech Stack

- **Flutter**
- **Dart**
- **http package**
- **FutureBuilder** for async UI updates
- **Visual Studio Code / Android Studio**



## ⚙️ Getting Started

### 1️⃣ Install Flutter
Make sure Flutter is installed and setup:
```bash
flutter --version
```


### 2️⃣ Clone the repository
```bash
git clone https://github.com/bhaumik-1910/Flutter_Fetch_Json_data.git
cd Flutter_Fetch_Json_data
```


### 3️⃣ Install dependencies
```bash
flutter pub get
```

### 4️⃣ Run the app
Android / iOS / Web
```bash
flutter run
```

### 📡 Fetching JSON Data
This project uses the http package to make HTTP GET requests. Example usage:
```bash
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Item>> fetchItems() async {
  final response = await http.get(Uri.parse("https://example.com/data.json"));

  if (response.statusCode == 200) {
    final List jsonData = jsonDecode(response.body);
    return jsonData.map((item) => Item.fromJson(item)).toList();
  } else {
    throw Exception("Failed to load data");
  }
}

```

## 📄 License

This project is licensed under the **MIT License**.

---

## 👤 Author

**Bhaumik Patel**  
GitHub: [@bhaumik-1910](https://github.com/bhaumik-1910)

---

## ⭐ Support

If you find this project useful, please give it a ⭐ on GitHub!
