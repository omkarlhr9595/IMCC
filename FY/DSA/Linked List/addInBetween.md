# Inserting element at any position of Linked List

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
