# odin-linked_lists

Implementation of linked lists in Ruby for the Odin Project.

I found it quite interesting to combine the different methods in order to get a good range of functionality including adding before or after particular members of the list.

Where possible I made use of existing methods to tidy up the code. For the 'tail' method I implemented it without using the 'size' method to make sure the method was as efficient as possible.

Where it is logical to do so, the methods return the value of the element added or removed.

The terminal demonstration builds the colors of the rainbow in a linked list and then sadly says good-bye to Indigo. I found these lines of code to be the most interesting manipulations of the Linked List:

```Ruby
puts "Insert #{Colors.insert_at('Orange', Colors.find('Red') + 1)} after Red..."
puts "Insert #{Colors.insert_at('Yellow', Colors.find('Green'))} before Green..."
```