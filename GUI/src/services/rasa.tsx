import { Node } from 'reactflow';

export const generateStorySteps = (nodes: Node<any, string | undefined>[]) => 
  nodes.map(({ data: { type, label, payload, checkpoint }}) => {
    switch (type) {
        case 'conditionNode':
            return { 
              condition: (payload.conditions || []).map((x: any) => {
                if(x.active_loop)
                  return { active_loop: x.active_loop.label }
                if(x.slot)
                  return { slot_was_set: { [x.slot.label]: x.value } }
                return null;
              }).filter(Boolean),
            };
        case 'intentNode':
            return {
                intent: label,
                entities: (payload.entities || []).map((x: any) => ({ [x.label]: x.value })),
            };
        case 'responseNode':
            return { action: label };
        case 'formNode':
            return {
                action: label,
                active_loop: payload.active_loop === false ? null: label,
            };
        case 'slotNode':
            return {
                slot_was_set: {
                  [label]: payload.value,
                }
            };
        case 'actionNode':
            return checkpoint
              ? { 'action': payload?.value || label, }
              : { 'action': label, }
        default:
            return null;
    }
  }).filter(Boolean);
