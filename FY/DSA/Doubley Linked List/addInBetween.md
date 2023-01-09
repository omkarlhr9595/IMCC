# Inserting At Specific location in the list (After a Node)

We can use the following steps to insert a new node after a node in the double linked list...

```
Step 1 - Create a newNode with given value.
Step 2 - Check whether list is Empty (head == NULL)
Step 3 - If it is Empty then, assign NULL to both newNode → previous & newNode → next and set newNode to head.
Step 4 - If it is not Empty then, define two node pointers temp1 & temp2 and initialize temp1 with head.
Step 5 - Keep moving the temp1 to its next node until it reaches to the node after which we want to insert the newNode (until temp1 → data is equal to location, here location is the node value after which we want to insert the newNode).
Step 6 - Every time check whether temp1 is reached to the last node. If it is reached to the last node then display 'Given node is not found in the list!!! Insertion not possible!!!' and terminate the function. Otherwise move the temp1 to next node.
Step 7 - Assign temp1 → next to temp2, newNode to temp1 → next, temp1 to newNode → previous, temp2 to newNode → next and newNode to temp2 → previous.

```

---

Another approach

# Here is an algorithm to add an element at any position of a linked list:

```
STEP 1 : Start traversing the linked list from the head node
STEP 2 : Find the position where you want to insert a new node.
STEP 3 : Create a new node with the data to be inserted
STEP 4 : Make the new node's next pointer point to the node which was pointing to the node at the position you wanted to insert
STEP 5 : Make the previous node's next pointer point to the new node.
STEP 6 : Make the new node's previous pointer point to the previous node.
STEP 7 : Make the new node the head node if it is to be inserted at the beginning
STEP 8 : Increment the size of the linked list by one.

```
