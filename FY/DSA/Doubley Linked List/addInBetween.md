# Inserting element at any position of Doubly Linked List

```
STEP 1 : Create newNode for given value
STEP 2 : Check whether list is Empty(head == null)
STEP 3 : if list is empty,
            set newNode->next = null
                head = newNode
STEP 4 : else
            temp = head;
            keep moving temp until we reach the required position
            after reached the postion
            newNode->next = temp->next
            temp->next = newNode

```

```
Here is an algorithm to add an element at any position of a linked list:

STEP 1 : Start traversing the linked list from the head node
STEP 2 : Find the position where you want to insert a new node.
STEP 3 : Create a new node with the data to be inserted
STEP 4 : Make the new node's next pointer point to the node which was pointing to the node at the position you wanted to insert
STEP 5 : Make the previous node's next pointer point to the new node.
STEP 6 : Make the new node's previous pointer point to the previous node.
STEP 7 : Make the new node the head node if it is to be inserted at the beginning
STEP 8 : Increment the size of the linked list by one.

```
