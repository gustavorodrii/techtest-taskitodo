<h1>Taski Todo (Flutter versão 3.27.0)</h1>

<h2>Pré-requisitos</h2>

<ul>
  <li>Flutter 3.27.0: Certifique-se de ter o Flutter 3.27.0 instalado em seu ambiente de desenvolvimento.</li>
  <li>Rode o comando no terminal -> flutter pub get.</li>
  <li>Acesso a pasta lib -> main.dart e rode clicando em RUN.</li>
</ul>



<p>TaskiTodo é um aplicativo de gerenciamento de tarefas desenvolvido com Flutter. O aplicativo permite a criação, visualização, edição e exclusão de tarefas, com foco em simplicidade e eficiência, utilizando o SharedPreferences para o armazenamento local.</p>

<h2>Funcionalidades</h2>

<ul>
  <li>Adicionar Tarefa: Crie novas tarefas.</li>
  <li>Listar Tarefas Pendentes: Exibe as tarefas não concluídas.</li>
  <li>Listar Tarefas Concluídas: Exibe as tarefas finalizadas.</li>
  <li>Pesquisar Tarefas: Procura por tarefas usando o título.</li>
  <li>Alterar Status da Tarefa: Marque tarefas como concluídas ou pendentes.</li>
  <li>Excluir Tarefa: Remova tarefas específicas.</li>
  <li>Limpar Tarefas Concluídas: Exclua todas as tarefas concluídas de uma vez.</li>
</ul>

<h2>Tecnologias Utilizadas</h2>

<ul>
  <li>Flutter: Framework principal para o desenvolvimento do aplicativo.</li>
  <li>Dart: Linguagem de programação utilizada.</li>
  <li>SharedPreferences: Armazenamento local de dados.</li>
  <li>flutter_test: Para testes de unidade e integração.</li>
</ul>

<h2>Arquitetura - MVVM</h2>

<p>O projeto segue a arquitetura MVVM (Model-View-ViewModel), dividida em camadas:</p>

<ul>
  <li>Datasource: Responsável pelo acesso aos dados no dispositivo (utilizando o SharedPreferences).</li>
  <li>Repositório: Abstração das chamadas ao datasource e lógica de negócios.</li>
  <li>Modelos: Estruturas de dados como TodoModel.</li>
  <li>View: Responsável pela criação da interface do usuário (UI).</li>
  <li>Service: Responsável pela resposta do datasource.</li>
  <li>Routes: Responsável pela navegaçao do projeto.</li>
  <li>Initialize: Cuida do start do projeto.</li>
  <li>Widgets: Widgets para utilizar no app.</li>
</ul>


<h2>Testes</h2>

<p>O projeto utiliza o pacote flutter_test para realizar testes de unidade e integração, garantindo a confiabilidade das funcionalidades. Para executar os testes, siga as etapas abaixo:</p>

<h3>Executando Testes de Unidade</h3>

<p>Acesse a pasta test no root do projeto e rode o group de cada teste.</p>