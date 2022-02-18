import 'package:flutter/material.dart';

// Definir la tabla
class EventoItem {
  final String cliente;
  final String evento;
  final int numIngressos;
  final double precoUnit;
  final double total;

  EventoItem(
      this.cliente, this.evento, this.numIngressos, this.precoUnit, this.total);
}

// Definir los valores de la lista
final List<EventoItem> _eventosList = [
  EventoItem('Alberto', 'Amizade', 7, 50.0, 350.0),
  EventoItem('Sofia', 'Amizade', 5, 50.0, 250.0),
  EventoItem('Pedro', 'Amizade', 4, 50.0, 200.0),
  EventoItem('Anna', 'Amizade', 3, 50.0, 150.0),
];

// Definir el widget de la tabla
Widget _buildTable({bool sortAscending = true}) {
  return DataTable(
    sortColumnIndex: 0,
    sortAscending: sortAscending,
    columns: <DataColumn>[
      DataColumn(
        label: Text('Cliente', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        tooltip: 'Cliente',
      ),
      DataColumn(
        label: Text('Evento', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        tooltip: 'Evento',
      ),
      DataColumn(
        label: Text('Ingressos', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        tooltip: 'Ingressos',
        numeric: true,
      ),
      DataColumn(
        label: Text('P.Unit.', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        tooltip: 'P.Unitario',
        numeric: true,
      ),
      DataColumn(
        label: Text('Total', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        tooltip: 'Total',
        numeric: true,
        onSort: (int columnIndex, bool ascending) {},
      ),
    ],
    rows: _eventosList.map<DataRow>((EventoItem eventoItem) {
      return DataRow(
        //  key: key(eventoItem.cliente),
        //   onSelectChanged: (bool selected) {},
        cells: <DataCell>[
          DataCell(
            Text(eventoItem.cliente, style: TextStyle(color: Colors.white)),
          ),
          DataCell(
            Text(eventoItem.evento, style: TextStyle(color: Colors.white)),
          ),
          DataCell(
            Text('${eventoItem.numIngressos}',
                style: TextStyle(color: Colors.white)),
          ),
          DataCell(
            Text('${eventoItem.precoUnit}',
                style: TextStyle(color: Colors.white)),
          ),
          DataCell(
            Text('${eventoItem.total}', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    }).toList(),
  );
}

class Info extends StatelessWidget {
  const Info();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sistema de Eventos')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/festa2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTable(sortAscending: true),
            Text(
              'VAMOS FESTEJAR!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
            ElevatedButton(
              onPressed: () {},
              child: Text('Pagar'), //Icon(Icons.arrow_back_outlined),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
