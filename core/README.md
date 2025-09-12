# Core — Módulo Compartilhado (HTTP, Gates, Pagination, BLoC)
Centraliza requisições HTTP, pagination, extensions/utilitários, env/config, gates (navegação/contratos) e BLoCs das features.

# Objetivo
Concentrar infraestrutura e contratos para reuso entre apps, manter regra de negócio e acoplamento baixo com a UI.
Fornecer base de BLoC, HTTP e navegação por gates.

# Estrutura de pastas
core/
├─ lib/
│  └─ app_way_data_core.dart        # export central do pacote
├─ src/
  ├─ app/                          # repos + datasources (chamadas à API)
  │  ├─ <feature>/
  │  │  ├─ domain (entities, repositories, usecases)
  │  │  └─ data (repositories, models, datasources)
  │  └─ ...
  ├─ core/                         # infraestrutura e utilitários compartilhados
  │  ├─ http/                      # client, interceptors, adapters
  │  ├─ gates/                     # contratos/abstrações de navegação
  │  ├─ pagination/                # modelos e helpers de paginação
  │  ├─ extensions/                # extensões de acordo com a necessidade..
  │  └─ env/                       # configuração de ambiente (dev/prd)
  ├─ features/                     # somente os BLoCs de cada feature
  │  ├─ <feature>/
  │  │  ├─ <feature>_event.dart
  │  │  │
  │  │  └─ <feature>_bloc.dart
  │  └─ ...
  └─ gates/                        # portões concretos de navegação por tela