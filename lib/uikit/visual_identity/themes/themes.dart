import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
part '../schemes/light_color_schemes.dart';

ThemeData get ligthTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: _lightColorScheme.onPrimary,
          fontSize: 18,
        ),
        backgroundColor: _lightColorScheme.onPrimaryContainer,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(
          _lightColorScheme.primary,
        ),
      ),
      cardTheme: CardTheme(
          elevation: 0.3,
          shadowColor: Colors.black.withOpacity(0.25),
          color: _lightColorScheme.tertiary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0.3),
          shadowColor: WidgetStatePropertyAll(
            Colors.black.withOpacity(0.25),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lightColorScheme.tertiary,
        hintStyle: Style.body,
        labelStyle: Style.body,
        floatingLabelStyle: Style.body,
        errorStyle: Style.body,
        helperStyle: Style.body,
        prefixStyle: Style.body,
        counterStyle: Style.body,
        suffixStyle: Style.body,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _lightColorScheme.onPrimary,
          ),
        ),
      ),
    );
