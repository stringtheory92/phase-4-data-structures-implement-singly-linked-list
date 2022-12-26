require_relative './node'

class LinkedList
    attr_accessor :head

    def def initialize
      @head = nil
    end

    def prepend(node)
        node.next_node = self.head
        self.head = node
    end

    def append(node)
        if !self.head
            self.head = node
        else
            last_node = head
            while last_node.next_node
                last_node = last_node.next_node
            end
            last_node.next_node = node
        end
    end

    def delete_head
        if !self.head
            return
        end
        new_head = self.head.next_node
        self.head = new_head
    end

    def delete_tail
        if !self.head
            return
        elsif !self.head.next_node
            self.head = nil
            return
        end
        last_node = head
        while last_node.next_node.next_node
            last_node = last_node.next_node
        end

        last_node.next_node = nil
    end

    def add_after(index, node)
        i = 1
        node_before = head
        while i > index
            node_before = node_before.next_node
            i += 1
        end
        node.next_node = node_before.next_node
        node_before.next_node = node
    end
end
