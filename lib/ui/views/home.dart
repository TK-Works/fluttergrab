import 'package:flutter/material.dart';
import 'package:fluttergrab/core/viewmodels/admin.dart';
import 'package:fluttergrab/core/viewmodels/instructor.dart';
import 'package:fluttergrab/core/viewmodels/student.dart';
import 'package:fluttergrab/ui/widgets/menu.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _searchCtrl = TextEditingController();
  TabController _tabController;
  bool _activeSearch = false;
  bool _isSearching = false;

  @override
  void initState() { 
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Widget _search(){
    return TextField(
      controller: _searchCtrl,
      autofocus: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
        suffixIcon: _isSearching ? IconButton(
          icon: Icon(Icons.cancel, color: Colors.black),
          onPressed: () => setState(() => _searchCtrl.clear()),
        ) : null,
      ),
      onChanged: (text) => setState(() => _isSearching = text.length > 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: _scaffoldKey,  
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text("Home"),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          _activeSearch ? 
          Container(
            width: MediaQuery.of(context).size.width * 0.60,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                _search(),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () => setState(() {
                    _searchCtrl.clear();
                    _activeSearch = false;
                  }),
                )
              ],
            ),
          ) : IconButton(
            icon: Icon(Icons.search),
            onPressed: () => setState(() => _activeSearch = true),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Colors.white,
          tabs: <Widget>[
            Tab(text: "Student"),
            Tab(text: "Instructor"),
            Tab(text: "Admin"),
          ]
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          StudentViewModel(),
          InstructorViewModel(),
          AdminViewModel(),
        ],
      ),
    );
  }
}