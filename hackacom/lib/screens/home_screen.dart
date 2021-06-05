import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackacom/models/ong.dart';
import 'package:hackacom/screens/list_ong_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ongs = <Ong>[
    Ong(
      "Projeto ajudei",
      "assets/ongs/ong1_1.png",
      ["assets/ongs/ong1_2.jpg", "assets/ongs/ong1_3.jpg", "assets/ongs/ong1_4.jpg"],
      "Animais",
      "Somos uma Associação que surgiu através de pessoas unidas para ajudar a causa animal. Nosso objetivo é fazer o bem! Unir forças a fim de salvar vidas! Desde sua fundação em 2014, o Projeto Ajudei já realizou: Mais de 700 resgates; Doou mais de 600 animais; Atua em casos de acumuladores de cães, auxiliando inclusive, as familias envolvidas, devolvendo assim a dignidade das pessoas e aos bichos. Resgatamos animais em situação de risco e abandono, tratamos e os preparamos para adoção. Tudo isso é feito com recursos próprios. Tais como venda de rifas, produtos da nossa lojinha, campanhas de arrecadação e doações voluntárias. Nossos resgatados ficam em Lares Temporários de pessoas voluntárias e em hotéis para Pets até e SE forem adotados.",
      "Curitiba - Paraná",
      [
        'assets/ongs/ong1_5.png',
        'assets/ongs/ong1_6.jpg',
        'assets/ongs/ong1_7.png',
        'assets/ongs/ong1_8.png'
      ],
    ),
    Ong(
      "Unidos pela vida",
      "assets/ongs/ong2_7.png",
      ["assets/ongs/ong2_1.png", "assets/ongs/ong2_3.jpg", "assets/ongs/ong2_6.png"],
      "Saúde",
      "Unidos pela Vida - Instituto Brasileiro de Atenção à Fibrose Cística, nossa maior alegria é poder ajudá-los a entender a Fibrose Cística e conviver melhor com esta rotina, além de contribuir fortemente pelo desenvolvimento deste ecossistema no Brasil. Hoje, quase 9 Anos depois de sua fundação oficial (22/11/11), o Unidos pela Vida – Instituto Brasileiro de Atenção à Fibrose Cística desenvolve nacionalmente projetos ligados à comunicação, suporte, educação, pesquisa, incentivo à atividade física, políticas públicas, advocacy e desenvolvimento organizacional Somos hoje uma das principais instituições de Fibrose Cística do país, e nossa missão é fortalecer e desenvolver o ecossistema da fibrose cística por meio de ações que impactem na melhora da qualidade de vida dos pacientes, familiares e demais envolvidos. Nossa visão é sermos reconhecidos como uma instituição referência na fibrose cística pelo acolhimento empático, pela entrega de resultados inovadores, consistentes e éticos, e por promover a atuação em conjunto. Por aqui, acreditamos que ATENÇÃO é o ato de conceder carinho e cuidados, sempre com boa vontade.",
      "Av. Winston Churchill, 2370 - Pinheirinho, Curitiba - PR, 81150-050",
      [
        'assets/ongs/ong2_2.jpg',
        'assets/ongs/ong2_4.jpg',
        'assets/ongs/ong2_5.png',
        'assets/ongs/ong2_8.png'
      ],
    ),
    Ong(
      "Bom Aluno",
      "assets/ongs/ong3_5.png",
      ["assets/ongs/ong3_3.jpg", "assets/ongs/ong3_7.jpg", "assets/ongs/ong3_8.jpg"],
      "Educação",
      "O Programa Bom Aluno é um instrumento de mudança social. O Programa acompanha e incentiva o desenvolvimento de alunos de baixa renda que demonstram talento, bom rendimento escolar e comprometimento, proporcionando a oportunidade de uma formação acadêmica de excelência a partir do 7º ano do ensino fundamental até a conclusão do ensino superior. O Bom Aluno oferece capacitação educacional e profissional para que os estudantes concluam os estudos com o preparo necessário para prosperar no exigente mundo do trabalho, conquistando o sucesso profissional. Em conjunto, são aprimoradas também as habilidades socioemocionais, incluindo aspectos da cidadania e da solidariedade, com o propósito de formar agentes de transformação social. Garantindo a credibilidade do Programa, em 25 anos de existência, atingimos resultados expressivos, como a marca de 100% de aprovação nos vestibulares, diversas conquistas acadêmicas e profissionais, além do forte impacto social em mais de 850 integrantes do Bom Aluno em todo o território nacional. Estas conquistas comprovam que, com o suporte de nossos profissionais, os Bons Alunos são capazes de realizar seus sonhos e deixar sua marca pelo mundo. Desta forma, contribuímos para o crescimento do país e para o desenvolvimento de um futuro melhor.",
      "Av. Manoel Ribas, 1800 Mercês, Curitiba - PR",
      [
        'assets/ongs/ong3_1.png',
        'assets/ongs/ong3_2.jpg',
        'assets/ongs/ong3_4.png',
        'assets/ongs/ong3_6.jpg'
      ],
    ),
    Ong(
      "ASID",
      "assets/ongs/ong4_3.png",
      ["assets/ongs/ong4_1.jpg", "assets/ongs/ong4_2.png", "assets/ongs/ong4_8.png"],
      "Inclusão Social",
      "A criação da ASID Brasil foi motivada por um contexto familiar, a história da irmã de um dos fundadores. A Laura nasceu com síndrome de Down e transtorno do espectro autista e durante toda sua vida enfrentou inúmeros desafios para se desenvolver. A partir da história dela e o contexto da pessoa com deficiência no Brasil, a ASID nasceu com uma missão: unir pessoas com deficiência, suas famílias, instituições, empresas e voluntários para construir uma sociedade inclusiva.",
      "R. Sen. Xavier da Silva, 26 - São Francisco, Curitiba - PR, 80530-022, Brazil",
      [
        'assets/ongs/ong4_4.jpg',
        'assets/ongs/ong4_5.jpg',
        'assets/ongs/ong4_6.jpg',
        'assets/ongs/ong4_7.jpg'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Theme.of(context).primaryColor, Theme.of(context).accentColor],
          stops: [0.0, 0.695],
          transform: GradientRotation(4 * sqrt2),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/logo2.png",
                    width: 200,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(padding: const EdgeInsets.all(20), child: _buildForm()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {

    var _controllerNome = TextEditingController();

    return Column(
      children: [
        Container(
          child: Column(
            children: [
              TextFormField(
                controller: _controllerNome,
                decoration: InputDecoration(
                  labelText: "Pesquise o nome da ONG",
                  border: OutlineInputBorder(),
                ),
                maxLength: 144,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      var filtered = this.ongs.where((ong) {
                        var filtroNome = _controllerNome.text != null && _controllerNome.text.isNotEmpty ?
                        ong.nome.toLowerCase().contains(_controllerNome.text.toLowerCase()) : true;
                        return filtroNome;
                      }).toList();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contextRoute) => GridOngs(filtered)));
                    },
                    child: Text(
                      "PESQUISAR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
