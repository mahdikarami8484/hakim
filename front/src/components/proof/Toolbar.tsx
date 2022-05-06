import { useEffect, useState } from "react";
import { normalPrompt } from "../../dialog";
import { sendTactic, subscribe, tryAuto, TryAutoResult } from "../../hakim";
import { g } from "../../i18n";
import css from "./toolbar.module.css";

export const ToolButton = ({ label, onClick }: { label: string, onClick: any }) => {
    return (
        <button className={css.toolButton} onClick={onClick}>
            {label}
        </button>
    );
}

const newAssert = async () => {
    const inp = await normalPrompt(g`input_assertion`);
    sendTactic(`add_hyp (${inp})`);
};

const AutoProofButton = () => {
    const [s, setS] = useState({ available: false } as TryAutoResult);
    useEffect(() => {
        return subscribe(() => {
            setS(tryAuto());
        });
    }, []);
    return (
        <button className={css.toolButton} onClick={() => { }}>
            {g`auto_proof`}
            {s.available && <><br /><span className={css.autoProof} onClick={async () => {
                for (const tac of s.tactic) {
                    await sendTactic(tac);
                }
            }}>{s.type === 'normal' ? '✓' : '🕮'}</span></>}
        </button>
    );
};

export const Toolbar = () => {
    return (
        <div className={css.toolContain}>
            <ToolButton onClick={newAssert} label={g`new_assertion`} />
            <AutoProofButton />
            <ToolButton onClick={() => {
                const tactic = window.prompt(g`enter_tactic`);
                if (tactic) {
                    sendTactic(tactic);
                }
            }} label={g`custom_tactic`} />
        </div>
    );
};