# Morphling: base do monorepo (contratos, abstrações, helpers, padronizações)

morphling/
└─ lib/
   ├─ morphling.dart                  # export principal do pacote
   └─ src/
      ├─ src.dart                     # agregador de exports internos
      ├─ injector.dart                # utilitários de injeção (nível src/)
      ├─ architecture/
      │  ├─ architecture.dart
      │  ├─ use_case.dart
      │  ├─ bloc/
      │  │  ├─ bloc.dart
      │  │  ├─ bloc_state.dart
      │  │  ├─ navigator.dart
      │  │  └─ screen.dart
      │  │     └─ mixins/
      │  │        └─ hud_mixin.dart
      │  ├─ exceptions/
      │  │  ├─ cache_exception.dart
      │  │  ├─ exceptions.dart
      │  │  └─ remote_exception.dart
      │  ├─ failures/
      │  │  ├─ cache_failure.dart
      │  │  ├─ failures.dart
      │  │  └─ remote_failure.dart
      │  └─ injection/
      │     ├─ inj_container.dart
      │     └─ injector.dart
      ├─ components/
      │  ├─ components.dart
      │  ├─ core/
      │  │  ├─ application_material_app.dart
      │  │  ├─ core.dart
      │  │  ├─ screen_state_builder.dart
      │  │  └─ screen_view.dart
      │  ├─ dialogs/
      │  │  ├─ dialogs.dart
      │  │  ├─ loading_step_dialog.dart
      │  │  └─ multi_selection_dialog.dart
      │  ├─ layout/
      │  │  ├─ full_size_layout_button.dart
      │  │  ├─ horizontal_spacer.dart
      │  │  ├─ layout.dart
      │  │  └─ vertical_spacer.dart
      │  └─ textfields/
      │     ├─ date_text_field.dart
      │     ├─ text_field_delayed.dart
      │     └─ textfields.dart
      └─ extensions/
         ├─ date_time.dart
         ├─ extensions.dart
         └─ time.dart
