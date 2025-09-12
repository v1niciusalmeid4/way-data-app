# Como rodar (passo a passo)
git clone https://github.com/v1niciusalmeid4/way-data-app.git

# Instale dependências na ordem correta
  A ordem importa porque os módulos se referenciam entre si.

cd morphling && flutter clean && flutter pub get && cd ..
cd core      && flutter clean && flutter pub get && cd ..
cd instance  && flutter clean && flutter pub get

# Execute em modo desenvolvimento ou prod (entrypoint main_dev.dart | main_prd.dart)
cd instance
flutter run -t lib/main_dev.dart | flutter run -t lib/main_prd.dart 

# Estrutura do projeto
/
├─ morphling/   # base do monorepo (contratos, abstrações, helpers, padronizações)
├─ core/        # domínio e componentes compartilháveis (entidades, casos de uso,
│               # serviços, widgets reutilizáveis, etc.)
└─ instance/    # app executável (UI, rotas, theme, composition root)

 # Decisões técnicas

 # BLoC via Streams
 * Por quê? Controle fino do ciclo de vida, baixo overhead, previsibilidade do fluxo, fácil composição entre camadas.
   Como? BLoCs expõem streams de estado (ex.: loading / stable / error) e recebem events/intents da UI.
 * Benefícios principais: Alta testabilidade (stubs/mocks em upstream). Separa orquestração (BLoC) de apresentação (Widgets).
 * Injeção de Dependências com getIt Por quê? Desacoplamento entre camadas e troca simples de implementações (ex.: mocks em testes).
   Como? Registrations por módulo/feature (ex.: AppInjector, FeatureInjector), com lazySingleton para serviços.
 * Benefícios: Inicialização controlada, pontos únicos de configuração e código mais limpo. Modularização morphling / core / instance
   Por quê? Reuso, escalabilidade e builds previsíveis. Como? core mantém tudo que é compartilhável e agnóstico ao app final.
   instance orquestra DI e UI final (composition root). morphling estabelece padrões do monorepo.
 * Benefícios: Menor acoplamento, organização por responsabilidade e facilidade de evolução.