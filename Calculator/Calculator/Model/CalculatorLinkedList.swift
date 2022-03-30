//
//  CalculatorLinkedList.swift
//  Calculator
//
//  Created by song on 2022/03/15.
//

import Foundation

final class Node<T> {
  private(set) var data: T
  var next: Node?
  var previous: Node?
  
  init(_ data: T) {
    self.data = data
    self.next = nil
    self.previous = nil
  }
}

final class LinkedList<T> {
  var head: Node<T>?
  var tail: Node<T>?
  var capacity: Int = Int.zero
  
  var isEmpty: Bool {
    if head == nil {
      return true
    }
    return false
  }

  func append(data: T) {
    let newNode = Node(data)
    
    if isEmpty {
      self.head = newNode
      self.tail = newNode
      self.capacity += 1
      return
    }
    self.tail?.next = newNode
    newNode.previous = tail
    self.tail = newNode
    self.capacity += 1
  }
  
  func removeFirst() -> T? {
    if isEmpty {
      return nil
    }
    let data = head?.data
    self.head = self.head?.next
    capacity -= 1
    return data
  }
  
  func removeLatest() {
    if isEmpty {
      return
    }
    tail?.previous?.next = nil
    self.tail = self.tail?.previous
    capacity -= 1
  }
  
  func removeAll() {
    if isEmpty {
      return
    }
    self.head = nil
    self.tail = nil
    capacity = Int.zero
  }
  
  func showAll() -> [T] {
    var allNode: [T] = []
    var current = self.head
    
    for _ in 0...capacity {
      guard let currentData = current?.data else {
        return allNode
      }
      allNode.append(currentData)
      current = current?.next
    }
    return allNode
  }
}

