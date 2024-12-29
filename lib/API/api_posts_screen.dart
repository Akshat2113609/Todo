import 'package:flutter/material.dart';
import 'api_service.dart'; 
import 'package:myapp/utilities/todo_tile.dart'; 

class ApiPostsScreen extends StatefulWidget {
  const ApiPostsScreen({super.key});

  @override
  State<ApiPostsScreen> createState() => _ApiPostsScreenState();
}

class _ApiPostsScreenState extends State<ApiPostsScreen> {
  List<dynamic> _posts = [];
  List<dynamic> _filteredPosts = [];
  bool _isLoading = true;
  String _error = '';
  String _searchQuery = ''; 
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchPosts(); 
    _searchController.addListener(_filterPosts); 
  }

  
  Future<void> _fetchPosts() async {
    try {
      final posts = await ApiService.fetchPosts();
      setState(() {
        _posts = posts.map((post) {
         
          post['completed'] = post['completed'] ?? false;
          return post;
        }).toList();
        _filteredPosts = _posts; 
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  
  void _filterPosts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _searchQuery = query;
      _filteredPosts = _posts.where((post) {
        return post['userId'].toString().contains(query); 
      }).toList();
    });
  }

 
  void _toggleCheckbox(bool? value, int index) {
    setState(() {
      
      _posts[index]['completed'] = value ?? false;
    });
  }

  
  void _deletePost(int index) {
    setState(() {
      _posts.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Color.fromARGB(24, 40, 66, 255) : Colors.yellow[200],
      appBar: AppBar(
        title: const Text('API Posts'),
        backgroundColor: isDarkMode ? Color.fromARGB(255, 9, 16, 106) : Colors.yellow[800],
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PostSearchDelegate(
                  _posts,
                  _filterPosts,
                  _toggleCheckbox,
                  _deletePost,
                ),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? Center(child: Text('Error: $_error'))
              : _searchQuery.isEmpty
                  ? ListView.builder(
                      itemCount: _posts.length,
                      itemBuilder: (context, index) {
                        final post = _posts[index];
                        return ToDoTile(
                          taskName: post['title'], 
                          taskCompleted: post['completed'], 
                          onChanged: (value) => _toggleCheckbox(value, index), 
                          deleteFunction: (context) => _deletePost(index), 
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: _filteredPosts.length,
                      itemBuilder: (context, index) {
                        final post = _filteredPosts[index];
                        return ToDoTile(
                          taskName: post['title'], 
                          taskCompleted: post['completed'], 
                          onChanged: (value) => _toggleCheckbox(value, index), 
                          deleteFunction: (context) => _deletePost(index), 
                        );
                      },
                    ),
    );
  }
}

class PostSearchDelegate extends SearchDelegate {
  final List<dynamic> posts;
  final Function filterCallback;
  final Function toggleCheckbox;
  final Function deletePost;

  PostSearchDelegate(
    this.posts,
    this.filterCallback,
    this.toggleCheckbox,
    this.deletePost,
  );

  @override
  String get searchFieldLabel => 'Search by User ID';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          filterCallback(); 
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredPosts = posts.where((post) {
      return post['userId'].toString().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        final post = filteredPosts[index];
        return ToDoTile(
          taskName: post['title'], 
          taskCompleted: post['completed'], 
          onChanged: (value) => toggleCheckbox(value, index), 
          deleteFunction: (context) => deletePost(index), 
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredPosts = posts.where((post) {
      return post['userId'].toString().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        final post = filteredPosts[index];
        return ToDoTile(
          taskName: post['title'], 
          taskCompleted: post['completed'], 
          onChanged: (value) => toggleCheckbox(value, index), 
          deleteFunction: (context) => deletePost(index), 
        );
      },
    );
  }
}
