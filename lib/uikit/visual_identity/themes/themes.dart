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
      inputDecorationTheme: InputDecorationTheme(
      
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
