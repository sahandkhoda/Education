/**
 * @(#)Queue_skeleton.java
 * 
 * This is a skeleton for the class Queue. If you build your class from this 
 * skeleton, rename the file "Queue.java".
 *
 * A queue (first in, first out) for String-objects implemented with an internal 
 * array. The array is automatically extended when needed.
 *
 * @author Anders Lindström
 * @version 0.1 2015/6/11
 */


public class Queue {
	
	// Members
    private String[] queue;
    private int noOfElements = 0; 
    // Capacity = queue.length, no need for an extra member.
    
    // Constructors
    public Queue(int size) {
    	// Create the String-array with indicated capacity.
    }
    
    // Access methods
    public int getNoOfElements() {
    	// ...
    }
    
    public boolean isEmpty() {
    	// Check, and return, whether the queue is empty or not.
    }
    
    // Mutator. Adds a string to the end of the queue.
    public void add(String s) {
    	// First, check if the array is full. If so call resize().
    	// Second, add s at end of queue and increment noOfElements.
    }
    
    // Mutator. Removes the head of the queue.
    public String remove() {
    	// If the queue is empty, return null.
    	// Else, create a temporary String-reference referencing 
    	// the first element
    	// Move all elements after the first one step, i.e pack 
    	// the array (this will overwrite the first position in the 
    	// array).
    	// Return the first element via the temporary reference.
    }
    
    public String toString() {
    	// Create and return a String of the form
    	// "[first element,second element,...]".
    }
    
    // Helper methods
    private void resize() {
    	// Create a new, temporary array, twice the size.
    	// Copy all elements from queue to the temporary array.
    	// Let the member queue reference the new array 
    	// (queue = temp;). NB, the original array will be 
    	// automatically "garbage collected".
    }
    
    private void pack(int pos) {
    	// In a loop, copy element at (pos+1) to pos, and so on 
    	// up to the last string in the queue.
    	// Decrement noOfElements.
    }
}