# atividade_extra2
# App do Clima - Atomic Design & Animações

Este projeto é um aplicativo Flutter de clima, totalmente refatorado utilizando os princípios do Atomic Design e enriquecido com animações para uma experiência mais dinâmica.

## Atomic Design
A estrutura do projeto foi organizada em quatro níveis principais:

- **Átomos**: Componentes básicos e reutilizáveis, como textos, ícones e descrições. Exemplo: `WeatherIcon`, `TemperatureText`, `CityNameText`, `WeatherDescription` (em `lib/ui/atoms/`).
- **Moléculas**: Combinações de átomos que formam pequenas unidades funcionais, como o grupo de ícone + temperatura (`IconTemperatureRow`) e botões (`UpdateWeatherButton`, `SearchCityButton`) (em `lib/ui/molecules/`).
- **Organismos**: Seções mais complexas compostas por moléculas e átomos, como o card principal de informações do clima (`WeatherCard`) e o grupo de botões (`WeatherActions`) (em `lib/ui/organisms/`).
- **Páginas**: A tela completa, que reúne todos os organismos, moléculas e átomos. Exemplo: `WeatherPage` (em `lib/ui/pages/`).

Cada componente tem apenas uma responsabilidade e pode ser reutilizado em diferentes partes do app.

## Animações Utilizadas
O app utiliza três animações principais:

1. **AnimatedOpacity**
   - Usada para animar a transição de opacidade do indicador de carregamento e do card de clima, tornando a aparição dos dados mais suave.
2. **AnimatedContainer**
   - O card de clima muda cor e raio de borda de forma animada ao trocar a cidade ou temperatura, criando uma sensação de dinamismo.
3. **AnimatedAlign**
   - O grupo de botões pode se mover suavemente na tela ao ser acionado, tornando a interface mais interativa.



Desenvolvido com Atomic Design e Flutter Animations para melhor experiência e organização!
