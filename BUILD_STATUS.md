# Статус сборки

В этой среде отсутствует Android SDK (aapt/aapt2/build-tools) и локальный Gradle, а исходящие загрузки из среды разработки недоступны. Поэтому APK здесь физически собрать невозможно без внешнего Android SDK.

Проект подготовлен для сборки на обычном ПК с Android Studio. `gradlew` автоматически скачает Gradle 8.10.2, после чего Android Gradle Plugin скачает необходимые зависимости.

Команда:

```bash
./gradlew assembleDebug
```

Результат:

`app/build/outputs/apk/debug/app-debug.apk`
