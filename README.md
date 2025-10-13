# SumNumber - Calculadora Básica

## 📋 Visão Geral

SumNumber é uma aplicação iOS simples desenvolvida em SwiftUI que implementa uma calculadora básica para soma de dois números inteiros. O projeto foi criado com foco na implementação de **testes unitários** para a camada de ViewModel e **testes de interface** (UI Tests) para validar a experiência do usuário.

## 🏗️ Arquitetura

O projeto segue uma arquitetura MVVM (Model-View-ViewModel) simples:

- **Views**: Interface do usuário em SwiftUI
- **ViewModels**: Lógica de negócio e estado da aplicação
- **Extensions**: Extensões para funcionalidades auxiliares (Logger)

### Estrutura de Pastas

```
SumNumber/
├── Views/
│   ├── HomeView.swift       # Tela inicial com navegação
│   └── SumView.swift        # Tela da calculadora
├── ViewModels/
│   └── SumViewModel.swift   # ViewModel com lógica de soma
├── Extensions/
│   └── Logger+Extensions.swift
└── SumNumberApp.swift       # Ponto de entrada da aplicação
```

## ⚙️ Funcionalidades

### Funcionalidades Principais

1. **Tela Inicial (HomeView)**
   - Botão de navegação para a calculadora

2. **Calculadora (SumView)**
   - Dois campos de entrada para números
   - Botão para realizar a soma
   - Exibição do resultado ou erro
   - Validação de entrada de dados

### Regras de Negócio

- ✅ Soma de números inteiros positivos e negativos
- ✅ Validação de entrada (apenas números inteiros)
- ✅ Tratamento de erros para entradas inválidas
- ✅ Limpeza automática de erros ao realizar nova operação

## 🧪 Estratégia de Testes

O projeto implementa uma cobertura completa de testes dividida em duas categorias principais:

### 1. Testes Unitários (SumViewModelTests)

**Localização**: `SumNumberTests/SumViewModelTests.swift`

Os testes unitários focam na validação da lógica de negócio da `SumViewModel`, seguindo o padrão **AAA (Arrange-Act-Assert)**:

#### Cenários Testados:

| Teste | Cenário | Resultado Esperado |
|-------|---------|-------------------|
| `test_GivenEmptyStrings_WhenSumming_ShouldReturnNil` | Strings vazias como entrada | `resultado = nil` |
| `test_GivenOneEmptyNumber_WhenSumming_ShouldReturnNil` | Uma entrada vazia | `resultado = nil` |
| `test_GivenInvalidString_WhenSumming_ShouldReturnNil` | Strings não numéricas (abc, cde) | `resultado = nil` |
| `test_GivenPositiveNumbers_WhenSumming_ShouldReturnCorrectResult` | Números positivos (4, 5) | `resultado = 9` |
| `test_GivenNegativeNumbers_WhenSumming_ShouldReturnCorrectResult` | Números negativos (-4, -5) | `resultado = -9` |

#### Características dos Testes Unitários:

- ✅ **Setup/Teardown**: Configuração e limpeza adequada do ambiente de teste
- ✅ **Logging**: Sistema de log para rastreabilidade dos testes
- ✅ **Nomenclatura clara**: Padrão `GivenWhenThen` para legibilidade

### 2. Testes de Interface (UI Tests)

**Localização**: `SumNumberUITests/`

Os testes de interface validam o comportamento da aplicação do ponto de vista do usuário:

#### HomeViewUITests

| Teste | Objetivo |
|-------|----------|
| `test_GivenAppLaunched_WhenViewingHome_ThenCalcularButtonExists` | Verifica existência do botão "Calcular" |
| `test_GivenHome_WhenTapCalcular_ThenNavigatesToSumView` | Valida navegação para a tela da calculadora |

#### SumViewUITests

| Teste | Cenário | Validação |
|-------|---------|-----------|
| `test_GivenSum_WhenViewingInitialScreen_ThenResultsIsNil` | Estado inicial da calculadora | Texto "Resultado: Sem valor" |
| `test_GivenTwoNumbers_WhenTapSum_ThenShowCorrectsResult` | Soma de números válidos (10 + 20) | Resultado correto exibido |
| `test_GivenTwoNumbers_WhenTapSumWithInvalidNumber_ThenShowError` | Entrada inválida ("20t") | Mensagem de erro exibida |

#### Características dos Testes de Interface:

- ✅ **Timeout configurável**: Controle de tempo de espera para elementos
- ✅ **Screenshots**: Capturas de tela para documentação visual
- ✅ **Accessibility Identifiers**: Identificadores para localização de elementos
- ✅ **XCTContext**: Organização de testes com contextos nomeados

## 🛠️ Tecnologias Utilizadas

- **Swift 5.9+**
- **SwiftUI** - Interface do usuário
- **XCTest** - Framework de testes
- **XCUITest** - Testes de interface
- **Logger (os.log)** - Sistema de logging



## 🔍 Qualidade do Código

### Padrões de Teste

- **AAA Pattern**: Arrange-Act-Assert para estruturação de testes
- **Given-When-Then**: Nomenclatura descritiva dos testes
- **Test Isolation**: Cada teste é independente e isolado
- **Setup/Teardown**: Preparação e limpeza adequada do ambiente

## 🚀 Como Executar os Testes

### Testes Unitários
```bash
# Via Xcode
⌘ + U (Command + U)

# Via linha de comando
xcodebuild test -scheme SumNumber -destination 'platform=iOS Simulator,name=iPhone 15'
```

### Testes de Interface
```bash
# Executar especificamente os UI Tests
xcodebuild test -scheme SumNumber -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:SumNumberUITests
```

---

**Desenvolvido por**: Thales Araújo  
**Data**: Setembro de 2025  
**Framework**: SwiftUI + XCTest
